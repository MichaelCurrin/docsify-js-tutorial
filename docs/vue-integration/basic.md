# Basic

## Load Vue on your page

Add the Vue script as a script tag. Here is an example using Vue and then Docsify loaded after `scrip the `window.$docsify` pa

```
<script>
window.$docsify = {
//    ...
}
</script>

<script src="//cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
```


## Add Vue elements

Next, add HTML elements which have appropriate Vue.js syntax. 

Note that you do not have to setup `Vue()` in any script tag - you only need the HTML.

For example, see a demo of `v-for` usage.

### Code

```html
<ul>
    <li v-for="i in 10">{{ i }}</li>
</ul>
```

### Result

<ul>
    <li v-for="i in 10">{{ i }}</li>
</ul>
