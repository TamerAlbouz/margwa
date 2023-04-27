import { MangaCardWrapper } from "./MangaCardWrapper";

export function MangaItem(props) {
  const { title, src, desc } = props;

  return (
    <MangaCardWrapper>
      <img className="h-52 w-36 rounded-sm" src={src} alt={title} />
      <div className="no-scrollbar flex flex-col gap-3 overflow-auto">
        <h1 className="text-xl font-medium">{title}</h1>
        <p className="no-scrollbar h-32 overflow-auto text-gray-400 ">{desc}</p>
      </div>
    </MangaCardWrapper>
  );
}
