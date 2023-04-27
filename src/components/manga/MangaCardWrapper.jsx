export function MangaCardWrapper(props) {
  const { children } = props;
  return (
    <div className="item-start flex w-1/3 cursor-pointer flex-row gap-5 rounded-md bg-secondary p-5 transition duration-700 ease-in-out hover:bg-secondary/30">
      {children}
    </div>
  );
}
