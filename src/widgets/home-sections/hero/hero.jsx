import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import styles from './hero.module.css';

const TAGS = ['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'];

export const Hero = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className={styles.inner}>
        <div>
          <h1 className={styles.title}>
            Ищите и находите подходящую работу среди <span className={styles.hl}>10,000+</span> проектов и покажите на что Вы способны!
          </h1>
          <div className={styles.searchRow}>
            <input className="input" placeholder="Какую работу ищете?" />
            <button className="btn btn-peach">Найти</button>
          </div>
          <div className={styles.tags}>
            {TAGS.map(c => (
              <button key={c} className={styles.tag} onClick={() => nav(`/exchange?cat=${c}`)}>{c}</button>
            ))}
            <button className={styles.tagAll} onClick={() => nav('/exchange')}>Все категории</button>
          </div>
        </div>
        <div className={styles.right}>
          <div className={styles.circle}>
            <img src={IMAGES.heroAvatar} alt="Hero" />
            <div className={styles.rating}>
              {[1,2,3,4,5].map(i => <span key={i}>★</span>)}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
