import { Game } from './game';

export module Input {
  let element: HTMLInputElement;

  export function init() {
    element = <HTMLInputElement>document.getElementById('input');

    document.addEventListener('keyup', function (event) {
      switch (event.keyCode) {
        case 13: {
          submit();
          focus();
        } break;

        case 27: {
          clear();
          focus();
        } break;
      }
    });

    element.addEventListener('blur', function () {
      focus();
    });

    document.addEventListener('click', function () {
      focus();
    });
  }

  export function focus() {
    element.focus();
  }

  function submit() {
    let command: string[] = parse();
    Game.update(command);
    clear();
  }

  function clear() {
    element.value = "";
  }

  function parse(): string[] {
    return element
      .value
      .toLowerCase()
      .split(' ')
      .filter(s => s);
  }
}
