# Manual

You can manually initialize a Vue instance.

You don't even need to enable script execution in your config.

## Code

<!--
    Dev note

    Having one code backtick part and one rendered part causes errors, so you have to go for one the other on the page. Putting the code in pre and code tags stops it from executing though (ID is not picked up).

    Below is the result copied from the browser result and with some changes.

    Note use of token punctuation to stop variables from evaluating.

    Just be careful to NOT indent manually or with a formatter as then the output displays with weird wrapping.
-->

<pre data-lang="markdown"><code class="lang-markdown">

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>div</span> <span class="token attr-name">id</span><span class="token attr-value"><span class="token punctuation attr-equals">=</span><span class="token punctuation">"</span>main<span class="token punctuation">"</span></span><span class="token punctuation">&gt;</span></span>Hello <span class="token punctuation">{{</span> msg <span class="token punctuation">}}</span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>div</span><span class="token punctuation">&gt;</span></span>

<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>script</span><span class="token punctuation">&gt;</span></span><span class="token script"><span class="token language-javascript">
  <span class="token keyword">new</span> <span class="token class-name">Vue</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
    el<span class="token operator">:</span> <span class="token string">'#main'</span><span class="token punctuation">,</span>
    data<span class="token operator">:</span> <span class="token punctuation">{</span> msg<span class="token operator">:</span> <span class="token string">'Vue'</span> <span class="token punctuation">}</span>
  <span class="token punctuation">}</span><span class="token punctuation">)</span>
</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>script</span><span class="token punctuation">&gt;</span></span></code></pre>

## Result

<div id="main">
    <i>Hello {{ msg }}!</i>
</div>

<script>
  new Vue({
    el: '#main',
    data: { msg: 'world' }
  })
</script>
