export module Log {
  let element: HTMLElement;

  export function init() {
    element = document.getElementById('log');
  }

  export function scrollDown() {
    window.scrollTo(0, document.body.scrollHeight);
  }

  export function add(text: string, immediate: boolean = false) {
    let paragraph = document.createElement('p');
    element.appendChild(paragraph);

    if (immediate) {
      lineImmediateReveal(paragraph, text);
    } else {
      paragraph.setAttribute('role', 'alert');
      lineReveal(paragraph, text);
    }
  }

  function lineRevealSpeed(length: number): number {
    if (length < 100)
      return 10;
    if (length < 300)
      return 7;
    if (length < 500)
      return 3;
    else
      return 1;
  }

  function lineImmediateReveal(paragraph: HTMLElement, text: string) {
    paragraph.textContent = text;
    scrollDown();
  }

  function lineReveal(paragraph: HTMLElement, text: string) {
    let index: number = 0,
        speed: number = lineRevealSpeed(text.length),
        interval: number;

    interval = setInterval(function () {
      paragraph.textContent += text[index];
      index++;
      scrollDown();

      if (index >= text.length) {
        clearInterval(interval);
      }
    }, speed);
  }

  export function clear() {
    while (element.lastChild) {
      element.removeChild(element.lastChild);
    }
  }
}
