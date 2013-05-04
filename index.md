---
layout: default
title: Lee Dohm
---

{% for post in site.posts limit:5 %}
# [{{ post.title }}]({{ post.url }})

***at {{ post.date | date_to_long_string }}***<br/>
*Filed Under: {{ post.tags | sort | array_to_sentence_string }}*

{% if post.excerpt %}
{{ post.excerpt }}

[Continue reading "{{ post.title }}"]({{ post.url }})
{% else %}

{{ post.content }}

{% endif %}
{% endfor %}

*[Find older posts ...](/archives.html)*
