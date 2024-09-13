---

kanban-plugin: board

---

## Todos

- [x] comment component #piz
- [x] refactor mutations, no using local state #piz
- [x] làm tạm trú #vin
- [x] create foreign keys #piz


## backlog

- [x] re-locate supabase and prisma functions (maybe in @server-actions/supabase or sth)
- [x] [consider using neobrutalism style components](https://www.neobrutalism.dev/)
- [x] noti toast for
	- [x] sign in/up/out
	- [x] created a post/comment
	- [x] commented post/comment
	- [x] reacted post/comment
	- [x] copied post URL
	- [x] saved post
	- [x] deleted (personal) post
	- [x] updated user preferences
	- [x] followed/unfollowed a user
	- [x] "Someone has mentioned you in ..."
- [x] add real data to posts
- [x] config font
- [x] enable RLS
	[Prisma Client RLS Example](https://github.com/prisma/prisma-client-extensions/tree/main/row-level-security#prisma-client-extension---row-level-security)
	
	[useSupabaseRowLevelSecurity](https://github.com/dthyresson/prisma-extension-supabase-rls#usesupabaserowlevelsecurity)
- [x] [User Feed Algorithm](https://huggingface.co/Supabase/gte-small)
	
	- shared posts
	
	Ref: [AI Search with PGlite & Transformers.js](https://supabase.com/blog/in-browser-semantic-search-pglite?ref=dailydev)


## learns

- [x] [Collection of high value information on specific application security topics](https://cheatsheetseries.owasp.org/index.html)
- [x] [General guideline on implementing auth in web applications](https://thecopenhagenbook.com/)  [completion:: 2024-09-13]
- [x] learn more about DB seeding  [completion:: 2024-09-13]
	https://supabase.com/blog/snaplet-is-now-open-source?ref=dailydev
	#db
- [x] Prisma & General DB crash course  [completion:: 2024-09-13]
	https://www.prisma.io/dataguide/intro
	
	How Prisma Migration works
	https://www.prisma.io/docs/orm/prisma-migrate/understanding-prisma-migrate/mental-model
	#db
- [x] [Why React Query ?](https://ui.dev/why-react-query)  [completion:: 2024-09-13]


***

## Archive

- [x] post id string uuid base 64 #piz 06-09 23:57
- [x] co-locate queries: place within the used component folder (nearest) #piz 07-09 23:02
- [x] _change query keys_
	'todos'
	'todos', 'list'
	'todos', 'list', 'done'
	'todos', 'item' 
	'todos', 'item', todo.id
	```ts
	const todoKeys = {
	  all: ['todos'] as const,
	  lists: () => [...todoKeys.all, 'list'] as const,
	  list: (filters: string) => [...todoKeys.lists(), { filters }] as const,
	  details: () => [...todoKeys.all, 'detail'] as const,
	  detail: (id: number) => [...todoKeys.details(), id] as const,
	}
	```
	#piz 07-09 23:02
- [x] chnage all component name to camelCase #piz 07-09 23:02
- [x] post creation error: post_userid_fkey #piz 07-09 23:02

%% kanban:settings
```
{"kanban-plugin":"board","hide-tags-in-title":true,"hide-tags-display":false,"tag-colors":[{"tagKey":"#piz","color":"rgba(255, 0, 0, 1)","backgroundColor":"rgba(0, 0, 0, 0.1)"}],"date-format":"DD-MM","date-display-format":"DD-MM","hide-date-display":false,"date-colors":[],"hide-date-in-title":true,"show-relative-date":true,"lane-width":500,"list-collapse":[null,null,false],"new-line-trigger":"shift-enter","show-checkboxes":true,"full-list-lane-width":true,"move-tags":true,"archive-with-date":true,"append-archive-date":true,"tag-action":"kanban","move-dates":true,"date-trigger":"@d","time-trigger":"@t"}
```
%%