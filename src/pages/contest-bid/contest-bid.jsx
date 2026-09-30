import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './contest-bid.module.css';

export const ContestBidPage = () => {
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
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit.</p>
              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => <div key={d} className={styles.doc}>📄 {d}</div>)}
              </div>
              <h3 style={{ fontSize: 18, fontWeight: 700, marginTop: 32, marginBottom: 16 }}>Принять участие</h3>
              <div className={styles.contestField}>
                <label>Описание</label>
                <textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 120 }} />
              </div>
              <div className={styles.contestField}>
                <label>Фотографии для конкурса</label>
                <div style={{ fontSize: 12, color: 'var(--c-gray)', marginBottom: 8 }}>Загрузите фотографии работ, которые Вы сделали для конкурса.</div>
                <div style={{ display: 'flex', gap: 12 }}>
                  <div style={{ width: 100, height: 100, background: '#F5F0FF', borderRadius: 8, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', cursor: 'pointer' }}>
                    <div style={{ fontSize: 24, color: 'var(--c-peach)' }}>+</div>
                    <div style={{ fontSize: 11, color: 'var(--c-peach)' }}>Добавить фото</div>
                  </div>
                  <img src={IMAGES.workImage1} alt="" style={{ width: 100, height: 100, borderRadius: 8, objectFit: 'cover' }} />
                  <img src={IMAGES.workImage2} alt="" style={{ width: 100, height: 100, borderRadius: 8, objectFit: 'cover' }} />
                </div>
              </div>
              <button className={`btn btn-primary ${styles.submit}`} onClick={() => toast('Работа отправлена!')}>Отправить работу</button>
            </div>
            <aside className={styles.side}>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                  </div>
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
