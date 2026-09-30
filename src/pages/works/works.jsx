import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
import styles from './works.module.css';

export const WorksPage = () => {
  const nav = useNavigate();
  const works = [...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS];
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <h1 className={styles.title}>65 ворков по дизайну</h1>
          <div className={styles.filters}>
            <input className="input" placeholder="Какую работу ищете?" />
            <select className="input">
              <option>По возрастанию цены</option>
              <option>По убыванию цены</option>
            </select>
          </div>
          <div className={styles.grid}>
            {works.slice(0, 12).map((w, i) => (
              <WorkCard
                key={i}
                work={{ ...w, avatar: `https://i.pravatar.cc/60?img=${20 + i}` }}
                onOrder={() => nav('/exchange')}
              />
            ))}
          </div>
          <div className={styles.more}>
            <button className="btn btn-outline">Загрузить еще</button>
          </div>
        </div>
      </section>
    </div>
  );
};
