import { Hero } from 'widgets/home-sections/hero/hero';
import { Categories } from 'widgets/home-sections/categories/categories';
import { ActiveWorks } from 'widgets/home-sections/active-works/active-works';
import { TopFreelancers } from 'widgets/home-sections/top-freelancers/top-freelancers';
import { HowToSolve } from 'widgets/home-sections/how-to-solve/how-to-solve';
import { HelpsBusiness } from 'widgets/home-sections/helps-business/helps-business';

export const HomePage = () => (
  <div className="pageFadeIn">
    <Hero />
    <Categories />
    <ActiveWorks />
    <TopFreelancers />
    <HowToSolve />
    <HelpsBusiness />
  </div>
);
