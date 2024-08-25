# Templates vs Layouts
- Templates are similiar to layouts, they wrap each child layout or page.
- Unlike layouts that persist across routes & maintain state, templates create a new instance for each of their children on navigation. (when a user navigates btw routes that share a template, a new instance jof the component is mounted, DOM elements are recreated, state is not preserved, effects are re-synchronized)

# Names
- ui
- utils
- hooks
- styles
- lib
- components

# Store all Project Files in Top-level Folders Inside app
```
app/
├─ components/
│  ├─ button.js
├─ dashboard/
│  ├─ billing/
│  │  ├─ page.js
│  ├─ page.js
│  ├─ profile/
│  │  ├─ page.js
├─ page.js
├─ layout.js
├─ _lib/
│  ├─ format-date.js
```
# Store Project Files Outside of the app Dir
```
app/
├─ dashboard/
components/
├─ ...
lib/
├─ ...

```
# Route Groups
> This will indicate that the folder should not be included in the route’s URL path, useful for organizational purposes.
```
app/
├─ (dashboard)/
│  ├─ components/
│  ├─ _lib/
│  ├─ profile/
│  ├─ billing/
├─ components/
│  ├─ ...
├─ _lib/
│  ├─ ...

```
# Components
- [ref](https://www.dhiwise.com/post/ultimate-guide-to-organizing-your-nextjs-components-folder)
```
components/
│
├── common/
│   ├── Button.js
│   ├── Icon.js
│   └── Loader.js
│
├── layout/
│   ├── Header.js
│   ├── Footer.js
│   └── Nav.js
│
├── forms/
│   ├── LoginForm.js
│   ├── ContactForm.js
│   └── SignUpForm.js
│
├── ui/
│   ├── Modal.js
│   ├── Tabs.js
│   └── Accordion.js
│
└── hoc/
    ├── withAuth.js
    └── withTheme.js
```
## Atomic Design Principles
```
components/
  atoms/
    Button.js
    Input.js
  molecules/
    SearchBar.js
    UserCard.js
  organisms/
    Header.js
    Footer.js
```
## Feature-based Grouping
```
components/
  user/
    UserProfile.js
    UserList.js
  blog/
    BlogPost.js
    BlogList.js
```
