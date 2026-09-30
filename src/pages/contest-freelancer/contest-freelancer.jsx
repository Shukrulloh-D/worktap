import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './contest-freelancer.module.css';

export const ContestFreelancerPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать рекламный баннер</h1>
              <div className={styles.meta}><strong>100 000 тенге</strong><span>до 14.07.2021</span></div>

              {['Название компании / частное лицо: McDonald\'s','Род деятельности компании: Бургеры','Каналы распространения и география продаж: Республика Казахстан, г. Алматы','Портрет целевой аудитории: от 6 до 20 лет','Укажите ближайших конкурентов: BurgerKing, KFC, JekakDoner'].map(f => (
                <div key={f} className={styles.contestField}>
                  <label>{f.split(':')[0]}:</label>
                  <div style={{ fontSize: 14 }}>{f.split(':').slice(1).join(':').trim()}</div>
                </div>
              ))}

              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => (
                  <div key={d} className={styles.doc}>📄 {d}</div>
                ))}
              </div>

              <button className={`btn btn-primary ${styles.submit}`} onClick={() => { toast('Вы участвуете в конкурсе'); nav('/contest-take-part'); }}>Участвовать в конкурсе</button>
            </div>

            <aside className={styles.side}>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Размещено проектов: 25</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                </div>
                <div style={{ fontSize: 13, color: 'var(--c-gray)' }}>15 отзывов</div>
                <div className={styles.tags}>
                  {['Дизайн баннера','Реклама','Дизайн соц сетей'].map(t => <span key={t} className={styles.tag}>{t}</span>)}
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
