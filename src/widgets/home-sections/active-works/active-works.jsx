import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
import styles from './active-works.module.css';

export const ActiveWorks = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className="container">
        <h2 className="h2">Актуальные ворки</h2>
        <div className={styles.grid}>
          {ACTIVE_WORKS.map((w, i) => (
            <WorkCard key={w.id} work={w} variant={i === 1 ? 'highlight' : 'default'} onOrder={() => nav('/exchange')} />
          ))}
          <div className={styles.more} onClick={() => nav('/works')}>Смотреть все ворки</div>
        </div>
      </div>
    </section>
  );
};
