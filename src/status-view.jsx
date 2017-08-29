import {h} from './link'

export default ({items, progressValue}) =>
<div class="status">
  {items.map(({name, count}) =>
    <div>
      <div class="count">{count}</div>
      <div class="name">{name}</div>
    </div>
  )}
  <progress value={progressValue} max="100"></progress>
</div>
