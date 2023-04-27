import { useQuery } from "@tanstack/react-query";

async function fetchManga() {
  const result = await fetch(
    "https://api.mangadex.org/manga?includes[]=cover_art&contentRating[]=safe",
    {
      method: "GET",
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
      params: {
        limit: 10,
      },
    }
  );

  const data = await result.json();
  return data.data;
}

export function useMangaQuery() {
  return useQuery({
    queryKey: ["manga"],
    queryFn: fetchManga,
    select: (data) => {
      return data;
    },
    onError: (error) => {
      console.log(error);
    },
  });
}
