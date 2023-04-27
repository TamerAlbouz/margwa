import { useEffect } from "react";
import { MangaItem } from "./MangaItem";
import { useState } from "react";
import { useMangaQuery } from "../../hooks/useMangaQuery";

export function MangaList() {
  const { data } = useMangaQuery();

  const [items, setItems] = useState([]);

  useEffect(() => {
    if (data) {
      setItems(data);
    }
  }, [data]);

  return (
    <div className="flex flex-wrap justify-center gap-5 p-5">
      {items.map((item) => (
        <MangaItem
          key={item.id}
          title={item.attributes.title.en}
          src={`https://uploads.mangadex.org/covers/${item.id}/${
            item.relationships.filter(
              (result) => result.type === "cover_art"
            )[0].attributes.fileName
          }`}
          desc={item.attributes.description.en}
        />
      ))}
    </div>
  );
}
