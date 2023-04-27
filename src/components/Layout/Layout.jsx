import { Footer } from "./Footer";
import { Header } from "./Header";

export function Layout(props) {
  const { children } = props;
  return (
    <div className="font-serif">
      <Header />
      <main className="bg-primary text-white">{children}</main>
      <Footer />
    </div>
  );
}
