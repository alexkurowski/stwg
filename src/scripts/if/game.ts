import { Log } from './log';

export module Game {
  export function init() {
    Log.add("ZORK I: The Great Underground Empire");
  }

  export function update(command: string[]) {
    Log.clear();
    Log.add("ZORK I: The Great Underground Empire", true);
    Log.add(`Your command: ${ command.join(' ') }.`);
  }
}
