```mysql
create table

public."AppUser" (

id uuid not null,

email text not null,

"fullName" text not null,

"userName" text not null,

password text not null,

"avatarUrl" text null,

bio text null,

"isActive" boolean null default false,

"privacyMode" public.PrivacyMode null default 'PUBLIC'::"PrivacyMode",

"createdAt" timestamp with time zone not null default (now() at time zone 'utc'::text),

"updatedAt" timestamp with time zone null,

"isDeleted" boolean null default false,

constraint AppUser_pkey primary key (id)

) tablespace pg_default;

create unique index if not exists "AppUser_email_key" on public."AppUser" using btree (email) tablespace pg_default;

create unique index if not exists "AppUser_fullName_key" on public."AppUser" using btree ("fullName") tablespace pg_default;

create unique index if not exists "AppUser_userName_key" on public."AppUser" using btree ("userName") tablespace pg_default;

create unique index if not exists "AppUser_avatarUrl_key" on public."AppUser" using btree ("avatarUrl") tablespace pg_default;
```