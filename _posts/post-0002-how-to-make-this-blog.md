% 这是怎样一个博客生成器
% Tang Zhixiong
% 2015-11-06


这是怎样一个博客生成器
======================

哪点与众不同？ {#special}
-------------

> Notice:
>
>> 这是前 36 个小时做的工作，用 Makefile 和 Shell 脚本弄了一个博客生成器。当然，最累最脏的活都是 Pandoc 干得，
>> 我只是把它们协调在了一起。用万总的话说，这叫“专业的人干专业的事”，用 Unix 哲学这叫 “Do one thing，and do it well”。
>> 代码和样例开源在 <a href="https://github.com/district10/blog/">GitHub</a>，欢迎试用、反馈、提交 Pull Request，
>> 欢迎分享、传播和安利。

从前天（2015-11-14 夜）开始，用了几乎完全脱产的一天来写这个博客工具[^nomeal]。

[^nomeal]: 都懒得没吃午饭和晚饭

现在（2015-11-16 中午）效果很赞，超出了我的预期。所以推广一下我这 36 个小时的成果。

本博客生成器用的是 Makefile、Bash 和 Pandoc，还有一点点 CSS 和 JavaScript，
没有用其他工具和语言，不用担心自己的博客生成器更新、
或者自己换了一台电脑或者操作系统就不能码字[^hexoshit]。

当然其它的博客工具通常都很酷炫，如果你要的是那种，可以用 [Hexo]、[Jekyll]。
本博客生成器比他们简单得多，而且不是 responsive design，在手机上或许惨不忍睹[^css]。
但好处是兼容性好、稳定、也不太难看。字体的选择和配色我也是拼了老命改了很久，不然怎么能像现在一样动人[^koanfont]。

[^koanfont]: 看过《西文字体 1》和《西文字体 2》，但是你想用的字体网页里又不一定能显示，what a pity。

建议快速看一下博客的特性，再到 [我要来一个](#我要来一个) 章节看如何在 Windows/Linux
上安装使用，备份在 GitHub，托管到七牛云盘。

[^hexoshit]: 就是因为 Hexo3 出来后我原来的博客死了，我才想到得自己弄这个初级而原始的工具。

[Hexo]: https://hexo.io/zh-cn/index.html "快速、简洁且高效的博客框架"

[Jekyll]: http://jekyllcn.com/ "Jekyll • 简单静态博客网站生成器"

[^css]: CSS 都是我手写，以及各种从网站扣。没有用任何 CSS 库，当然做不到响应式（不过我也不 indent to）。

支持的特性
----------

### 增强的 Mardown

强调

:   * **加粗**、*斜体*，或者***一起用***
    * ~~2^^10^^ = 2014~~ ==> 2^^10^^ = 1024, H~2~O 和 $H_2O$ 都是生命之源[^water]
    * 三种连字符：1 - 1，1 -- 8，1 --- one（en-dash，em-dash，和……）
    * <span style="font-variant:small-caps;">Small caps</span>
    
    <kbd>c-x</kbd> 在 Emacs 里指的是 Control-X

    ```markdown
    * **加粗**、*斜体*，或者***一起用***
    * ~~2^^10^^ = 2014~~ ==> 2^^10^^ = 1024, H~2~O 和 $H_2O$ 都是生命之源[^water]
    * 三种连字符：1 - 1，1 -- 8，1 --- one（en-dash，em-dash，和……）
    * <span style="font-variant:small-caps;">Small caps</span>
    * <kbd>c-x</kbd> 在 Emacs 里指的是 Control-X
 
    [^water]: 看上去不一样，其实都是“水”。
    ```

[^water]: 看上去不一样，其实都是“水”。

列表

:    有序列表

    1. Stay hungry
    2. Stay foolish

    无序列表

    * All work and no play
    * makes Jacky a dull boy

    一起用

    1. one
    2. two
        * two-one
    	* two-two
    3. three
        1. three-one
    	2. three-two
	
表格

: 这部分的 CSS 我还没有调好，只是勉强能用。

    | Right | Left | Default | Center |
    |------:|:-----|---------|:------:|
    |   12  |  12  |    12   |    12  |
    |  123  |  123 |   123   |   123  |
    |    1  |    1 |     1   |     1  |

引用

:     下面这段来自[*Terminator 2（终结者）*](http://www.imdb.com/character/ch0000933/quotes)

    > The future has not been written. 
    > There is no fate but what we make for ourselves. 
    > I wish I could believe that. My name is John Connor,
    > they tried to murder me before I was born, 
    > when I was 13 they tried again. Machines from the future. 
    > Terminators. All my life my mother told me
    > the storm was coming, Judgment Day, the beginning of the war 
    > between man and machines. Three billion lives would vanish 
    > in an instant, and I would lead what was left of
    > the human race to ultimate victory. It hasn't happened,
    > no bombs fell, computers didn't take control, we stopped Judgment Day.
    > I should feel safe, but I don't, so I live off the grid -
    > no phone, no address, no one and nothing can find me. 
    > I've erased all connections to the past, but as hard as I try 
    > I can't erase my dreams, my nightmares. 

章节

:    header 1--6

    # Header 1
    ## Header 2
    ### Header 3
    #### Header 4
    ##### Header 5
    ###### Header 6


Markdown 中使用 HTML

:    下面是一个 `<div style="background-color=violet">`{.html} 的 HTML 标记：

    <div style="background-color:violet">
    <p style="background-color:black;color:white;margin:10px;">
    一个“黑纸白字”的段落</p>
    <p>
    你可以用 HTML 标记来<b>加粗</b>、<i>斜体</i>或者改变文字的
    <font style="color:red">颜色</font>、
    <font style="font-size:20px">字号</font>、
    <font style="font-family:Impact,Georgia,Serif;">font</font> family
    还可使用 Markdown，如下：
    </p>

    <div markdown="1" style="background-color:yellow;margin:10px;">
    **注**：这些文字在一个 `<div markdown="1" style="background-color:yellow;margin:10px;">` 中用 Markdown 写成
    
    可以 **加粗** 也可以 *斜体*
    
    甚至可以使用 Pandoc Markdown 的上下标（以及列表）：
    
    * ~~2^^10^^ = 2014~~
    * 2^^10^^ = 1024
    * H~2~O 是生命之源
    
    | Key | Value | Notes |
    | :------: | -------: | -------: |
    | Foo | *fool* | 第一列居中 |
    | **Bar** | barbaric | 第二列右对齐 |
    | Cup | cap cup c u ***dummy*** | 第三列左对齐 | 
    
    </div>
    </div>

页内引用

:    点我 [回到“与众不同”小节](#special)（这是定制的 tag）

     点我 [回到“支持的特性”小节](#支持的特性)（这是自动生成的 tag），具体看 [源码](#ghraw)。

列表自动编号

:    #. one
     #. two
     
      9)  Ninth
     10)  Tenth
     11)  Eleventh
            i. subone
           ii. subtwo
          iii. subthree
          
         #. one
         #. two
         
          9)  Ninth
         10)  Tenth
         11)  Eleventh
                i. subone
               ii. subtwo
              iii. subthree

上面列举特性用的都是“名词解释”这一特性，“名词解释”的基本写法是：

```markdown
Term 1

:   Definition 1

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

        Third paragraph of definition 2.

(@)  My first example will be numbered (1).
(@)  My second example will be numbered (2).

Explanation of examples.

(@逗你玩)  My third example will be numbered (3).
Numbered examples can be labeled and referred to elsewhere in the document:

(@)  This is a good example.

As (@逗你玩) illustrates, ...
```

写出来就是：

Term 1

:   Definition 1

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

        Third paragraph of definition 2.

(@)  My first example will be numbered (1).
(@)  My second example will be numbered (2).

Explanation of examples.

(@逗你玩)  My third example will be numbered (3).
Numbered examples can be labeled and referred to elsewhere in the document:

(@)  This is a good example.

As (@逗你玩) illustrates, ...

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.

```markdown
-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.
```

四种链接的方式：

[one][my label 1], and [two][my label 2] and [three][my label 3] and [four][my label 4]

（代码的最大宽度超过了 80 chars，就超了边界，这个我觉得不是本博客生成器的 bug。Keep the rule!）

[my label 1]: /foo/bar.html  "My title, optional"
[my label 2]: /foo
[my label 3]: http://fsf.org (The free software foundation)
[my label 4]: /bar#special  'A title in single quotes'

```markdown
[one][my label 1], and [two][my label 2] and [three][my label 3] and [four][my label 4]

[my label 1]: /foo/bar.html  "My title, optional"
[my label 2]: /foo
[my label 3]: http://fsf.org (The free software foundation)
[my label 4]: /bar#special  'A title in single quotes'
```

[my website][]  is good, even [my website] is good, even [this]. 

Hash Tag[^hashtag]

[^hashtag]: 其实在 weibo/twitter 上才叫 hash tag，这里或许应该叫 section ref link。

* See [above]
* See [table](#table)
* See [codetag](#codetag)

[my website]: /shit
[good]: /bar/baz <good>
[this]: /baz
[above]: #good

```markdown
[my website][]  is good, even [my website] is good, even [this]. 

Hash Tag[^hashtag]

[^hashtag]: 其实在 weibo/twitter 上才叫 hash tag，这里或许应该叫 section ref link。

* See [above]
* See [table](#table)
* See [codetag](#codetag)

[my website]: /shit
[good]: /bar/baz <good>
[this]: /baz
[above]: #good
```

段落内的图片，caption 不显示： ![inline-pic-without-showing-this-text]

单独一段的图片，显示 caption：

![standalone-pic-small-one]

当然，也可以不显示：

![][standalone-pic-big-one]

[inline-pic-without-showing-this-text]: http://gnat-tang-shared-image.qiniudn.com/emoji/11.gif

[standalone-pic-small-one]: http://imglf.nosdn.127.net/img/cXkrRlR2ZnlJNE93Sm1va0R1RlRhMXloSEd2Y1hWM0NGSWplSExnQnNTSERpbDVRUTdxL2lnPT0.jpg

[standalone-pic-big-one]: http://imglf0.ph.126.net/FkB_RjGf7iH0Im3jf_3lWQ==/6630541099630719693.png "本来想用 Gatsby 挥拳打 Tom 的图片"

```markdown
段落内的图片，caption 不显示： ![inline-pic-without-showing-this-text]

单独一段的图片，显示 caption：

![standalone-pic-small-one]

当然，也可以不显示：

![][standalone-pic-big-one]

[inline-pic-without-showing-this-text]: http://gnat-tang-shared-image.qiniudn.com/emoji/11.gif

[standalone-pic-small-one]: http://imglf.nosdn.127.net/img/cXkrRlR2ZnlJNE93Sm1va0R1RlRhMXloSEd2Y1hWM0NGSWplSExnQnNTSERpbDVRUTdxL2lnPT0.jpg

[standalone-pic-big-one]: http://imglf0.ph.126.net/FkB_RjGf7iH0Im3jf_3lWQ==/6630541099630719693.png "本来想用 Gatsby 挥拳打 Tom 的图片"
```

### 代码高亮

行内高亮特别赞。我一般不会说我会 Shell 脚本 `echo -e "hello\nworld" | sort`{.bash}，
还会写网页 `<h1 id="hello-pandoc">HTML code</h1>`{.html}。

如果你觉得那不算代码，我还会用 C++ 写类：

```cpp
class Log
{
private:
    static size_t    counter;

public:
    BCD::TypeID      type;
    BCD::ActionID    action;
    QString          message;
    qint64           timestamp;

public:
    Log( BCD::TypeID tid, BCD::ActionID aid, QString msg="", qint64 ts=0 ) :
        type( tid ),
        action( aid ),
        message( msg ),
        timestamp( 0 == ts ? QDateTime::currentMSecsSinceEpoch() : ts )
    { ++counter; }

    Log &show( );
};
```

会用 C 写函数：

```c
// RAW_SPAN       = 3
// RAW_TYPE       = float
// RAW_PRINTF_STR = " %20.10lf "
void raw2pts( FILE *ifp, FILE *ofp )
{
    fseek( ifp, 0, SEEK_END );
    size_t len = ftell( ifp );
    len /= ( RAW_SPAN * sizeof( RAW_TYPE ) );
    fseek( ifp, 0, SEEK_SET );

    RAW_TYPE buf[RAW_SPAN];

    int i = 0, j = 0;
    for ( i = 0; i < len; ++i ) {
        fread( buf, sizeof( RAW_TYPE ), RAW_SPAN, ifp );
        for ( j = 0; j < RAW_SPAN; ++j ) {
            fprintf( ofp, RAW_PRINTF_STR, buf[j] );
        }
        fprintf( ofp, "\n" );
    }
    
    fprintf( stdout, "--Parsed %d points.\n", len ); 
}
```

还会 CMake：

```bash
#!/bin/bash

BUILD="../build"
rm -Rf $BUILD
mkdir $BUILD && cd $BUILD && \
cmake.exe -G"Visual Studio 10 2010 Win64" ../ \
&& echo 'done'
|| rm -Rf $BUILD
```

Haskell 没学懂，但看懂是没问题：

~~~~ {#mycode .haskell .numberLines startFrom="100"}
qsort []     = []
qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
               qsort (filter (>= x) xs)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

看 [这段代码](#mycode) 高亮得多好啊！

### 数学公式

不管用了多少年的 M$ Word，总有一天写论文你要用 $\LaTeX$，那就从 MathJax 开始练习吧。

一个矩阵

$$
        \begin{matrix}
        1 & x & x^2 \\
        1 & y & y^2 \\
        1 & z & z^2 \\
        \end{matrix}
$$

一次运算

$$
\begin{align}
\sqrt{37} & = \sqrt{\frac{73^2-1}{12^2}} \\
 & = \sqrt{\frac{73^2}{12^2}\cdot\frac{73^2-1}{73^2}} \\ 
 & = \sqrt{\frac{73^2}{12^2}}\sqrt{\frac{73^2-1}{73^2}} \\
 & = \frac{73}{12}\sqrt{1 - \frac{1}{73^2}} \\ 
 & \approx \frac{73}{12}\left(1 - \frac{1}{2\cdot73^2}\right)
\end{align}
$$

下面列举公式的种种

$$\sum_{i=1}^n a_i=0$$

$$\hat x \widehat{yz}$$

$$f(x_1,x_x,\ldots,x_n) = x_1^2 + x_2^2 + \cdots + x_n^2 $$

$$\sum^{j-1}_{k=0}{\widehat{\gamma}_{kj} z_k}$$

$$ \left[
    \begin{array}{cc|c}
      1&2&3\\
      4&5&6
    \end{array}
\right] $$

$$   f(n) =
\begin{cases}
n/2,  & \text{if $n$ is even} \\
3n+1, & \text{if $n$ is odd}
\end{cases} $$

$$ \begin{array}{c|lcr}
n & \text{Left} & \text{Center} & \text{Right} \\
\hline
1 & 0.24 & 1 & 125 \\
2 & -1 & 189 & -8 \\
3 & -20 & 2000 & 1+10i
\end{array} $$

$$ \color{green}{green: }\color{red}{\frac{x}{y}} $$

$$ \underset{j=1}{\overset{\infty}{\LARGE\mathrm K}}\frac{a_j}{b_j}=\cfrac{a_1}{b_1+\cfrac{a_2}{b_2+\cfrac{a_3}{b_3+\ddots}}} $$

$$ f\left(
   \left[ 
     \frac{
       1+\left\{x,y\right\}
     }{
       \left(
          \frac{x}{y}+\frac{y}{x}
       \right)
       \left(u+1\right)
     }+a
   \right]^{3/2}
\right) $$

$\require{AMScd}$
\begin{CD}
    A @>a>> B\\
    @V b V V\# @VV c V\\
    C @>>d> D
    \end{CD}

   \begin{CD}
    A @>>> B @>{\text{very long label}}>> C \\
    @. @AAA @| \\
    D @= E @<<< F
    \end{CD}

$$
\require{enclose}
\begin{array}{r}
                    13  \\[-3pt]
4 \enclose{longdiv}{52} \\[-3pt]
         \underline{4}\phantom{2} \\[-3pt]
                    12  \\[-3pt]
         \underline{12}
\end{array}
$$

| Operators | LaTeX |
| :-------: | :---: |
| $\pm\mp$ | `\pm\mp` |
| $\times\div$ | `\times\div` |
| $\cdot\ast$ | `\cdot\ast` |
| $\star\dagger\diamond$ | `\star\dagger\diamond` |
| $\vee\wedge$ | `\vee\wedge` |
| $\oplus\ominus\otimes\circ$ | `\oplus\ominus\otimes\circ` |
| $\setminus$ | `\setminus` |
| $\wr$ | `\wr` |
| $\sqrt{x}$ | `\sqrt{x}` |
| $\le\ge\neq$ | `\le\ge\neq` |
| $\sim\ll\gg\doteq\simeq$ | `\sim\ll\gg\doteq\simeq` |
| $\subset\supset\approx\asymp\subseteq\supseteq$ | `\subset\supset\approx\asymp\subseteq\supseteq` |
| $\in\ni$ | `\in\ni` |
| $\smile$ | `\smile` |
| $\propto$ | `\propto` |
| $\dashv\vdash$ | `\dashv\vdash` |
| $\mid\perp\parallel$ | `\mid\prep\parallel` |
| $\nmid$ | `\nmid` |
| $\ldots\vdots\cdots\ddots$ | `\ldots\vdots\cdots\ddots` |
| $\hat{x}\check{x}\dot{x}\breve{x}\acute{x}$ | `\hat{x}\check{x}\dot{x}\breve{x}\acute{x}` |
| $\ddot{x}\grave{x}\tilde{x}\mathring{x}\bar{x}\vec{x}$ | `\ddot{x}\grave{x}\tilde{x}\mathring{x}\bar{x}\vec{x}` |
| $\vec{\jmath}\tilde{\jmath}$ | `\vec{\jmath}\tilde{\imath}` |
| $\widehat{3+x}\widetilde{abc}$ | `\widehat{3+x}\widetilde{abc}` |
| $\infty\triangle\angle$ | `\infty\triangle\angle` |
| $\aleph\hbar\imath$ | `\aleph\hbar\imath` |
| $\ell\wp$ | `\ell\wp` |
| $\Re\Im$ | `\Re\Im` |
| $\mho\prime$ | `\mho\prime` |
| $\flat\natural\sharp\$ | `\flat\natural\sharp` |
| $\surd\partial\top\bot\forall\neg$ | `\surd\partial\top\bot\forall\neg` |
| $\S$ | `\S` |

下面列举各种符号

* `\frac`: $\frac{2}{x+2}$
* `dfrac`: $\dfrac{2}{x+2}$
* `cfrac`: $\cfrac{2}{1+\cfrac{2}{1+\cfrac{2}{1+\cfrac{2}{1}}}}$
* `\sqrt`: $\sqrt{2}$
* `\sqrt[n]{x}`: $\sqrt[n]{x}$
* `\sum`: $\sum_{i=1}^{\infty}\frac{1}{i}$
* `\prod`: $\prod_{n=1}^5\frac{n}{n-1}$
* `\lim`: $\lim_{x\to\infty}\frac{1}{x}$
* `\log`: $\log_n n^2$
* `\bmod`: $9\equiv 3 \bmod{6}$
* `\pmod`: $9\equiv 3 \pmod{6}$
* `\mod`: $9\equiv 3 \mod{6}$
* `\pod`: $9\equiv 3 \pod{6}$
* `\binom`: $\binom{n-1}{r-1}$
* `\dbinom`(in display mode): $\dbinom{9}{3}$
* `\cos\sin\tan\sec\csc\cot`{.tex}: $\cos\sin\tan\sec\csc\cot$
* `\arccos\arcsin\arctan`: $\arccos\arcsin\arctan$
* `\cosh\sinh\tanh\coth`: $\cosh\sinh\tanh\coth$
* `\cos^2 x +\sin^2 x = 1`: $\cos^2 x +\sin^2 x = 1$
* `\cos 90^\circ = 0`: $\cos 90^\circ = 0$
* `\frac`: $\frac{d}{dx}\left(x^2\right) = 2x$
* `\int`, `\,dx`: $\int 2x\,dx = x^2+C$
* `\partial`: $\frac{\partial^2U}{\partial x^2} + \frac{\partial^2U}{\partial y^2}$
* `\oint`: $\frac{1}{4\pi}\oint_\Sigma\frac{1}{r}\frac{\partial U}{\partial n} ds$
* `\overline`: $\overline{a+b\imath}$
* `\underline`: $\underline{431}$
* `\mathbb`: $\mathbb{R}\mathbb{Z}\mathbb{Q}$
* `\mathbf`: $\mathbf{R}\mathbf{Z}\mathbf{Q}$
* `\mathcal`: $\mathcal{R}\mathcal{Z}\mathcal{Q}$
* `\mathfrak`: $\mathfrak{R}\mathfrak{Z}\mathfrak{Q}$

更多矩阵对齐的例子：

The characteristic polynomial $f(\lambda)$ of the $3 \times 3$ matrix $$
\begin{pmatrix}
a & b & c \\
d & e & f \\
g & h & i
\end{pmatrix}
$$ is given by the equation $$
f(\lambda)
= \begin{vmatrix}
\lambda - a & -b & -c \\
-d & \lambda - e & -f \\
-g & -h & \lambda - i
\end{vmatrix}.
$$

~~~ {.tex}
The characteristic polynomial $f(\lambda)$ of the $3 \times 3$ matrix $$
\begin{pmatrix}
a & b & c \\
d & e & f \\
g & h & i
\end{pmatrix}
$$ is given by the equation $$
f(\lambda)
= \begin{vmatrix}
\lambda - a & -b & -c \\
-d & \lambda - e & -f \\
-g & -h & \lambda - i
\end{vmatrix}.
$$
~~~

$$
f(x) = \left\{ \begin{array}{ll}
x+7 & \mbox{if $5< x$};\\
x^2-3 & \mbox{if $-3 \le x \le 5$};\\
-x & \mbox{if $x < -3$}.\end{array} \right. 
$$

~~~ {.tex}
f(x) = \left\{ \begin{array}{ll}
x+7 & \mbox{if $5< x$};\\
x^2-3 & \mbox{if $-3 \le x \le 5$};\\
-x & \mbox{if $x < -3$}.\end{array} \right. 
~~~

$$ 
f(x) = \begin{cases}
x+7 & \text{if $5< x$}; \\
x^2-3 & \text{if $-3 \le x \le 5$};\\
-x & \text{if $x < -3$}.
\end{cases}
$$

~~~ {.latex}
f(x) = \begin{cases}
x+7 & \text{if $5< x$}; \\
x^2-3 & \text{if $-3 \le x \le 5$};\\
-x & \text{if $x < -3$}.
\end{cases}
~~~

[this]: https://www.zybuluo.com/gnat-xj/note/30681

访问 [MathJax](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference) 参考更多使用方法。

如果你要手工给 HTML 添加 MathJax 功能，需要在页面中加入
`<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>`{.html}


我要来一个
----------

下面介绍如何

1. 在 Windows/Linux 上安装使用，
2. 备份到 GitHub，
3. 托管到七牛云盘。

首先（1），Windows 上需要安装 Git for Windows，可以参考我以前写的笔记：[github-guide/配置-Windows.md at master · whudoc/github-guide](https://github.com/whudoc/github-guide/blob/master/%E9%85%8D%E7%BD%AE-Windows.md)。
还需要 Pandoc，[下载](http://gnat.qiniudn.com/pandoc-1.13.2-windows.msi) 后一步步点击就可以。

Linux 上安装 git 和 pandoc 都太容易，用 `sudo apt-get install git pandoc`{.bash} 就可以。

然后可以先下载 [我的博客](https://github.com/district10/blog/archive/master.zip)，
解压后进入文件夹，右键打开 Git Bash，输入 `make`{.bash} 完成编译，不出意外的话会有一个 `public` 文件夹生成。
打开里面的 `index.html`，是不是和你现在正看的网页一模一样？就这么简单。

<small>
本博客生成器的核心是调用 pandoc 来把用 markdown 写的博客生成 HTML 页面，
如果想了解如何调用，你得仔细看看 [Makefile](https://github.com/district10/blog/blob/master/Makefile)[^makefile]。
博客下的文件夹有

1. `_koans`：呓语，类似微博吐槽。
2. `_notes`：笔记，类似个人维基。
3. `_parts`：页面的 footer 和主页的 header。
4. `_posts`：博客主体，一个 post 就是一篇博客。
5. `_static`：CSS 和一些单独的页面。
</small>

[^makefile]: 几十行的 Makefile 我写了好久，好久。一边学一遍写。

其次（2），fork 我的 repo，修改如下几处：

1. [`_parts/footer.html`](https://github.com/district10/blog/blob/master/_parts/footer.html) 里的主页名称和三个变量

    ```javascript
    mdPath = 'https://github.com/district10/blog/blob/master';
    rawPath = 'https://raw.githubusercontent.com/district10/blog/master';
    basePath = 'https://github.com/district10/blog';
    ```
2. [`_parts/header.html`](https://github.com/district10/blog/blob/master/_parts/header.html)，这是主页的 banner，我想你不愿意用我的。
3. `_posts` 文件夹里写自己的博客，写好后到 Makefile 里加上

    ```makefile
    HTML = \
    $(POST_000N_OUT) \                                        # 这是你新加的
    $(POST_0002_OUT) \

    # posts
    POST_000N_INS = $(PIDIR)/post-00N-your-post-title.md      # 这是你新加的
    POST_000N_OUT = $(PODIR)/post-00N-your-post-title.html    # 这是你新加的
    POST_0002_INS = $(PIDIR)/post-002-how-to-make-this-blog.md
    POST_0002_OUT = $(PODIR)/post-002-how-to-make-this-blog.html
    
    # posts
    $(POST_000N_OUT): $(POST_000N_INS)                        # 这是你新加的
    	$(PANDOC_NORMAL) $^ -o $@
    $(POST_0002_OUT): $(POST_0002_INS)
    	$(PANDOC_NORMAL) $^ -o $@
    ```
4. 似乎没有其它了。    

最后（3），上传到七牛。先到 [qrsync 命令行同步工具 | 七牛云存储](http://developer.qiniu.com/docs/v6/tools/qrsync.html)
下载命令行同步工具，下载解压后放到系统变量 `%PATH%` 里。再找个安全的位置，新建一个文件 `conf.json`：

```json
{
    "src":          "publish 文件夹的绝对路径",
    "dest":         "qiniu:access_key=<AccessKey>&secret_key=<SecretKey>&bucket=<Bucket>",
    "debug_level":  1
}
```

其中的 `<AccessKey>`、`<SecretKey>` 从七牛网上拿到，如下图：

![从七牛获取 AK、SK](http://gnat.qiniudn.com/misc/qiniuconf.jpg)

注意妥善保存不要泄露。

`<Bucket>` 是你的“空间”名，记得弄个好记的名字：

![我不保证你能自定义简短的 Bucket Name](http://gnat.qiniudn.com/misc/qiniubucket.jpg)

然后打开 Git Bash 输入 `qsync conf.json`{.bash} 就可以把生成的博客传到七牛云盘，就可以访问了。

![Qiniu Sync，快如闪电](http://gnat.qiniudn.com/misc/qiniusync.jpg)

最后，<span style="font-variant:small-caps;">bon appetite</span>～

致谢
----

感谢我喜欢的一些网站如
[简书 - 交流故事，沟通想法](http://www.jianshu.com/)，
[LOFTER（乐乎） - 每个人的理想国](http://www.lofter.com/)，
我从上面扣了一些 CSS，
感谢 [七牛云存储 - 移动时代的云存储服务商](http://www.qiniu.com/)，
感谢 [Pandoc]，感谢 GNU Make 以及 Git，感谢 GitHub、MathJax。
我们这个时代真是太牛逼了，开源社区有这么多好用的工具。

[Pandoc]: http://pandoc.org/README.html

其它
----

Pandoc 的引用功能这里没有介绍。本博客支持用 bib 文件（可以从 Mendeley 导出）引用参考文献。

---

Refs

* [Pandoc Markdown Official Site](http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html)
* [The pandoc-siteproc package](http://hackage.haskell.org/package/pandoc-citeproc)
* [Art of Problem Solving - LaTeX: Symbols](http://www.artofproblemsolving.com/wiki/index.php/LaTeX:Symbols)
* [Art of Problem Solving - LaTeX: Commands](http://www.artofproblemsolving.com/wiki/index.php/LaTeX:Commands)
* 我以前的博客（已经下线）