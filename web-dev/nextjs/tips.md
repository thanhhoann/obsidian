# Don't place "use client" in "leaf" components
- Don't put "use client" in high level components, this will make the child components also client-side, which will increase the bundle size.
- If the parent component is a client component and the children (props) is server component, it will be the same server component.

# To use 3rd party UI component, create a separate component file
```
'use client';
import Carousel from 'react-carousel';
export default Carousel;
```
> If "Carousel" requires some Brower's API, it must be dynamic import from the parent component.
```
import Carousel from '@/components/Carousel';

dynamic(() => import('react-carousel'));

export const ParentComponent = () => {
  return <Carousel />
}
```
