import { Input } from './input';
import { Log } from './log';
import { Game } from './game';

Input.init();
Log.init();
Game.init();

Input.focus();
Log.scrollDown();
