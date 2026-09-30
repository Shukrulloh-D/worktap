import { useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { EXCHANGE_JOBS } from 'shared/api/mocks';
import { StarIcon } from 'shared/ui/icon';
import styles from './exchange.module.css';

const TAGS = ['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'];

export const ExchangePage = () => {
  const nav = useNavigate();
  const [params] = useSearchParams();
  const [visible, setVisible] = useState(6);
  const category = params.get('cat') || 'дизайну';
  const jobs = [...EXCHANGE_JOBS, ...EXCHANGE_JOBS].slice(0, visible);

  return (
    <div className="pageFadeIn">
      <section className={styles.top}>
        <div className="container">
          <h1 className={styles.title}>
            Ищите и находите подходящую работу среди <span className={styles.hl}>10,000+</span> проектов
          </h1>
          <div className={styles.searchRow}>
            <input className="input" placeholder="Какую работу ищете?" />
            <button className="btn btn-peach">Найти</button>
          </div>
          <div className={styles.tags}>
            {TAGS.map(c => (
              <button key={c} className={styles.tag} onClick={() => nav(`/exchange?cat=${c}`)}>{c}</button>
            ))}
          </div>
        </div>
      </section>

      <section className={styles.list}>
        <div className="container">
          <h2 className={styles.listTitle}>Ниже все заказы по {category}</h2>

          <div className={styles.filters}>
            <div className={styles.count}>65 проектов по {category}</div>
            <div className={styles.filtersRight}>
              <input className="input" placeholder="Мин. цена" />
              <input className="input" placeholder="Макс. цена" />
              <select className="input">
                <option>По возрастанию цены</option>
                <option>По убыванию цены</option>
              </select>
            </div>
          </div>

          {jobs.map((j, idx) => (
            <div key={idx} className={styles.job}>
              <div>
                <h3 className={styles.jobTitle}>{j.title}</h3>
                <div className={styles.author}>
                  <img src={j.avatar} alt="" />
                  <div>
                    <div className={styles.authorName}>{j.author}</div>
                    <div className={styles.authorMeta}>Размещено проектов на бирже: {j.postedProjects}</div>
                  </div>
                </div>
                <div className={styles.stars}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= j.rating} size={14} />)}
                  <span className={styles.reviewsCount}>{j.reviews} отзывов</span>
                </div>
              </div>
              <div className={styles.jobRight}>
                <div>
                  <div className={styles.budget}>Бюджет: {j.budget.toLocaleString()} тенге</div>
                  <div className={styles.time}>{j.time}</div>
                  <div className={styles.offers}>Предложений: {j.offers}</div>
                </div>
              </div>
            </div>
          ))}

          {visible < 16 && (
            <div className={styles.more}>
              <button className="btn btn-outline" onClick={() => setVisible(v => v + 6)}>Загрузить еще</button>
            </div>
          )}
        </div>
      </section>
    </div>
  );
};
