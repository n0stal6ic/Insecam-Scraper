import { DOMParser } from "https://deno.land/x/deno_dom/deno-dom-wasm.ts";

let cams = [];

async function fetchPage(i, callback) {
  let req = await fetch(`http://insecam.org/en/bynew/?page=${i}`);
  let res = await req.text();
  let dom = new DOMParser().parseFromString(res, "text/html");

  let thumbnails = dom.querySelectorAll(".thumbnail-item__wrap");
  for (let thumbnail of thumbnails) {
    let url = `http://insecam.org${thumbnail.attributes.href}`;
    await callback(url);
  }
}

async function fetchCam(cam) {
    try {
        let req = await fetch(cam);
        let res = await req.text();
        let dom = new DOMParser().parseFromString(res, "text/html");
          
        let element = dom.querySelector(".img-responsive.img-rounded.detailimage");
        let url = new URL(element.attributes.src);
        console.log(url.origin);
    } catch {
        console.error(`failed fetching ${cam}`)
    }
}

async function main() {
    for(let i = 0; i < 1000; i++) {
        setTimeout(() => {
            fetchPage(i, url => fetchCam(url))
        }, i * 200)
    }
}

main()