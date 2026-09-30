import { useNavigate } from 'react-router-dom';
import { CATEGORIES } from 'shared/api/mocks';
import styles from './categories.module.css';

export const Categories = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className="container">
        <h3 className={styles.title}>Выберите рубрику, чтобы начать</h3>
        <div className={styles.list}>
          {CATEGORIES.map(c => (
            <button key={c.id} className={styles.chip} onClick={() => nav(`/exchange?cat=${c.name}`)}>{c.name}</button>
          ))}
          <button className={styles.chipAll} onClick={() => nav('/exchange')}>Все категории</button>
        </div>
      </div>
    </section>
  );
};
