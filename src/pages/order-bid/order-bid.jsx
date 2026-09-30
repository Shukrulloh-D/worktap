import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './order-bid.module.css';

export const OrderBidPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать Дизайн сайта по тематике авто</h1>
              <div className={styles.meta}><strong>50 000 тенге</strong><span>до 14.07.2021</span></div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit.</p>
              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => <div key={d} className={styles.doc}>📄 {d}</div>)}
              </div>
              <button className={`btn btn-primary ${styles.submit}`} onClick={() => toast('Услуга предложена')}>Предложить услугу</button>
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
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
