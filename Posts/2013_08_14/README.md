Building a Github Blog
=========

Everyone knows how powerful Github is for hosting code and sharing it with people from all around the world, but wouldn't it be nice to have a place in everyone's list of repositories to bring some sanity and personality to their contributions? What if that place could be a reposity itself? How meta...

So, we decided to do just that!  

**To start your own blog, just [fork](https://github.com/uacaps/Blog/fork) this reposity.** 

=========

##### Why Github?

Most of us either read or run tech blogs and have to deal with all the hassle of maintaining a site and directing links back to our github repositories. It is our vision to cut out the middle man and have a blog for every user, driven by github <code>README.md</code> files, with full support for code snippets and internal project hosting. Most of us are already very familiar with the markdown of <code>README.md</code> files, so if you can make a readme, you can run a blog.

##### A Look From the Top

Setting up your blog is as easy as forking this repository. Immediately, you have a blog up and running in your name for anyone who visits. At the top level, you have: 

* Your <code>.gitignore</code> 
* Your <code>README.md</code> that serves as your blog's front page 
* A ruby script called <code>blurb.rb</code> (more on this later)
* A resources directory for general images, etc.
* A posts directory where your posts are stored

##### Posts

The posts directory has subdirectories ordered chronologically. If you want to create a new post, simply check out the repository to your computer, make a new folder with a name in the same pattern as those provided, and add a <code>README.md</code> to that folder. Write yourself a blog post in the <code>README.md</code>, commit and sync to see the new post reflected on github.

##### Updating the Front Page

An ambitious individual might take the time to write a blurb for the front page that links back internallly to the blog post they just created. Let us be clear that **we are not that ambitious**. To generate a blurb for the front page, run the ruby script <code>blurb.rb</code> found in the top level of your repository. This ruby script will generate a blurb in your terminal that you may copy paste into your front page readme with the internal link to your post generated for you.

##### Using <code>blurb.rb</code>

This handy tool allows you to make a link-through blurb about the post you created in your Terminal. Just navigate your terminal to the top-level Blog directory and then use it like so:

```shell
Input:
./blurb.rb -u uacaps -p Posts/2013_08_14/README.md

Options:
-u : Github username
-p : Path to the post's README you created
-r : [OPTIONAL] - the name of the Repo if you aren't using "Blog"

Output:
////////////// POST BLURB //////////////

### [Building a Github Blog](https://github.com/uacaps/Blog/tree/master/Posts/2013_08_14)

Everyone knows how powerful Github is for hosting code and sharing it with people from all around the world, but wouldn't it be nice to have a place in everyone's list of repositories to bring some sanity and personality to their contributions? What if that place could be a reposity itself? How meta...

**Posted** - *Wednesday 14 August, 2013*

///////////////////////////////////////
```

This just allows you to copy and paste this blurb and add that to the **Recent Posts** section of your frontpage README without doing too much extra work to get something nice to add.

##### Spread the Word

So that's all it takes to make your own tech blog, courtesy of Github. We're looking forward to seeing what everyone does with their forks. Enjoy!

##### Helpful Links

[Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) - adam-p

**Posted** - *Wednesday 14th August, 2013*
