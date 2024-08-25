# Project structure
## Behavior of Components in the `components/` Directory
### Inside app/
If you place the `components/` directory inside the `app/` directory, the components will default to being server components. This behavior aligns with the rule that all components within the `app/` directory are treated as server components unless explicitly marked otherwise.
Here’s how it works:
- **Server Components by Default**: Any component inside the `app/components/` directory will be treated as a server component by default.
- **Marking Client Components**: If you want a component inside `app/components/` to be treated as a client component, you must add the `"use client";` directive at the top of the file.
### Outside app/
> This follows a "routing purposes only" for app/

For components in the `components/` directory (outside the `app/` directory), you don't need to explicitly state `"use server"` or `"use client"`. Their behavior is determined by the context in which they are used
- **Default Context**: Components in the `components/` directory will act as server or client components based on how they are imported and used within your application.
- **Server Context**: If you use a component from `components/` inside a server component (within the `app/` directory), it will be treated as a server component.
- **Client Context**: If you need a component from `components/` to act as a client component, you can explicitly declare it with `"use client";` at the top of the file. This makes it a client component regardless of where it is used.