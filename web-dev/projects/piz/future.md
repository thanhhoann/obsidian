```sql
-- create table repost (
--     id UUID primary key,
--     user_id UUID references AppUse(id) on delete cascade,
--     created_at TIMESTAMPTZ default now(),
--     content_type CONTENT_TYPE,
--     post_id UUID references post(id) on delete cascade,
--     comment_id UUID references comment(id) on delete cascade
-- );
-- create table Mute (
--     id UUID primary key,
--     muter_id UUID references AppUse(id) on delete cascade,
--     muted_id UUID references AppUse(id) on delete cascade,
--     muted_at TIMESTAMPTZ default now(),
--     updated_at TIMESTAMPTZ
-- );
-- create table chat (
--     id UUID primary key,
--     first_user_id UUID references AppUse(id) on delete cascade,
--     second_user_id UUID references AppUse(id) on delete cascade,
--     is_deleted BOOLEAN default false,
--     color_scheme TEXT,
--     first_user_nickname TEXT,
--     second_user_nickname TEXT,
--     created_at TIMESTAMPTZ default now()
-- );
--
-- create table message (
--     id UUID primary key,
--     chat_id UUID references chat(id) on delete cascade,
--     sender_id UUID references AppUse(id) on delete cascade,
--     receiver_id UUID references AppUse(id) on delete cascade,
--     content TEXT not null,
--     created_at TIMESTAMPTZ default now(),
--     updated_at TIMESTAMPTZ,
--     is_deleted BOOLEAN default false,
--     is_read BOOLEAN default false
-- );
--
-- create table story (
--     id UUID primary key,
--     user_id UUID references AppUse(id) on delete cascade,
--     content TEXT not null,
--     created_at TIMESTAMPTZ default now(),
--     expiration_time TIMESTAMPTZ
-- );

```
