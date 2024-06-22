---
id: piz
aliases: []
tags: []
---

# users
- array(user)

# user - current
- followers : array of followers 
- followings : array of followings

# user - others
- id : string
- avatar : string
- user_name : string
- full_name : string
- no_followers : string
- profile_url : string (*)

# posts
> note : fetch posts from db, then if a post is belongs to a user, add it to the user's profile; else add it to user's feed
- id : string
- url : string
- likes : int
- dislikes : int
- posted_at : string

