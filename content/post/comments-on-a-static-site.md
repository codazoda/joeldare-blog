---
date: "2017-05-04"
title: "How I Implemented Comments on a Static Site"
tags: ["tech","hugo"]
comments: [
    "This is really awesome. -codazoda",
    "I love it. -ananymous"
]
---

I'm using a static site generator for this blog and I was looking for a simple way to add comments without using a 3rd party tool like Disqus. I don't want a 3rd party tracking my users and I don't want to encumber my blog with any server backend. I want the site to be so simple that you could easily host it from your basement on a Raspberry Pi or otherwise very small computer.

## Adding Comments to the Post Front Matter

I decided to use a simple array of comments in the front matter of each of my posts. The yaml front-matter for this post looks like this.

    ---
    date: "2017-05-04"
    title: "Comments on a Static Site"
    comments: [
        "This is really awesome. -codazoda",
        "I love it. -ananymous"
    ]
    ---

Because it's added to the post itself, I will just have a form that emails me user comments. As part of my moderation process I'll copy those from the email and paste them into my post. It's a little work but not bad for the number of comments I get.

## Updating the Theme to Include Comments

Once I had decided to add comments to the front-matter I just needed to update my theme template to pull those comments into the post. Since I'm using Hugo I needed to update my `single.html` file so that it included comments. I used a *partial* for this but you could also include it directly into the page. Here's the code that brings in my partial.

    {{ partial "comments.html" . }}

Then I created a `comments.html` file with the following content. Again, this example is specific to Hugo so you'll want to use the templating engine for whatever static site generator you're using.

    {{ if .Params.Comments }}
    <div>
        <h2 style="margin-top: 50px;">Comments</h2>
        <ul style="margin-top: 20px;">
            {{ range .Params.Comments }}
            <li>
                {{ . }}
            </li>
            {{ end }}
        </ul>
    </div>
    {{end}}

## Submitting Comments

Now that I've got a way to show comments on my posts I need a way for users to submit comments. Because I'm a big fan of building minimum viable products (MVP's) I'm going to opt for a simple mail link. I'll probably expand on that later.

So, that's it. Comments are now part of my blog. They live in the front-matter forever, are committed to my source code repo, and published to my site. Nothing fancy is required to display them so my blog can still run on minimalist hardware.
