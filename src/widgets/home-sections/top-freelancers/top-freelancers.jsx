import { useNavigate } from 'react-router-dom';
import { FreelancerCard } from 'entities/freelancer';
import { FREELANCERS } from 'shared/api/mocks';
import styles from './top-freelancers.module.css';

export const TopFreelancers = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className="container">
        <h2 className="h2">Топ фрилансеров</h2>
        <div className={styles.grid}>
          {FREELANCERS.map(f => <FreelancerCard key={f.id} freelancer={f} />)}
          <div className={styles.more} onClick={() => nav('/exchange')}>Посмотреть всех ТОП фрилансеров</div>
        </div>
      </div>
    </section>
  );
};
