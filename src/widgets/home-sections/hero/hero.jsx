import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import styles from './hero.module.css';

const TAGS = ['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'];

export const Hero = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className={styles.inner}>
        <div className={styles.left}>
          <h1 className={styles.title}>
            Покупайте фриланс-услуги<br />
            в <span className={styles.hl}>два клика</span>
          </h1>
          <p className={styles.subtitle}>Ворк — единица работы продавца, которую можно купить как товар в магазине</p>
          <div className={styles.searchRow}>
            <input className="input" placeholder="Что нужно сделать?" />
            <button className="btn btn-peach">Найти</button>
          </div>
          <div className={styles.tagsTitle}>Выберите рубрику, чтобы начать</div>
          <div className={styles.tags}>
            {TAGS.map(c => (
              <button key={c} className={styles.tag} onClick={() => nav(`/exchange?cat=${c}`)}>{c}</button>
            ))}
            <button className={styles.tagAll} onClick={() => nav('/exchange')}>Все категории</button>
          </div>
        </div>

        {/* ЗАМЕНИ ФОТО В IMAGES.heroAvatar (src/shared/config/images.js) */}
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
