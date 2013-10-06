---
layout: index
title: Home
---

{% for post in site.posts limit:5 %}
# [{{ post.title }}]({{ post.url }})

*Posted on {{ post.date | date_to_long_string }} under {{ post.tags | sort | array_to_sentence_string }}*

{% if post.excerpt != post.content %}
{{ post.excerpt }}

[Continue reading "{{ post.title }}"]({{ post.url }})
{% else %}

{{ post.content }}

{% endif %}
{% endfor %}
