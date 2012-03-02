# Writing good commit messages

Good commit messages serve at least three important purposes:

* To speed up the reviewing process.

* To help us write a good release note.

* To help the future maintainers of rmBug (it could be you!), say five years into the future, to find out why a particular change was made to the code or why a specific feature was added.

Structure your commit message like this:

<pre>
Summarize clearly in one line what the commit is about

Describe the problem the commit solves or the use
case for a new feature. Justify why you chose
the particular solution.
</pre>

## DO

* Write the summary line and description of what you have done in the imperative mode, that is as if you were commanding someone. Write "fix", "add", "change" instead of "fixed", "added", "changed".

* Always leave the second line blank.

* Line break the commit message (to make the commit message readable without having to scroll horizontally in @gitk@).

## DON'T

* Don't end the summary line with a period.

## Tips

* If it seems difficult to summarize what your commit does, it may be because it includes several logical changes or bug fixes, and are better split up into several commits using @git add -p@.

## References

The following blog post has a nice discussion of commit messages:

"On commit messages":http://who-t.blogspot.com/2009/12/on-commit-messages.html

## Credits

We are thankful for the nice people over at [Erlang](https://github.com/erlang/otp/wiki/Writing-good-commit-messages) for
such a nice guide to writing useful commit messages.
