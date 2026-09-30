import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './order-owner.module.css';

export const OrderOwnerPage = () => {
  const toast = useToast();
  const bids = Array(6).fill(null).map((_, i) => ({ id: i + 1, name: 'Никита Евреев', price: '50 000 тг', days: '3 дня' }));
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать Дизайн сайта по тематике авто</h1>
              <div className={styles.meta}><strong>50 000 тенге</strong><span>до 14.07.2021</span></div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit.</p>

              <h3 style={{ fontSize: 18, fontWeight: 700, marginTop: 32, marginBottom: 16 }}>Ставки фрилансеров</h3>
              {bids.map(b => (
                <div key={b.id} className={styles.bid}>
                  <div className={styles.bidHead}>
                    <div className={styles.bidPrice}>{b.price}</div>
                    <div className={styles.bidDays}>{b.days}</div>
                  </div>
                  <div className={styles.bidAuthor}>
                    <img src={IMAGES.reviewAvatar} alt="" />
                    <div>
                      <div style={{ fontWeight: 700 }}>{b.name}</div>
                      <div style={{ display: 'flex', gap: 2 }}>
                        {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={12} />)}
                      </div>
                    </div>
                  </div>
                  <div style={{ fontSize: 13, color: 'var(--c-gray)' }}>Количество доработок: 5</div>
                  <div className={styles.bidActions}>
                    <button className={`${styles.bidBtn} ${styles.bidAccept}`} onClick={() => toast('Исполнитель выбран')}>Выбрать</button>
                    <button className={`${styles.bidBtn} ${styles.bidDecline}`} onClick={() => toast('Отклонено')}>Отклонить</button>
                  </div>
                </div>
              ))}
            </div>
            <aside className={styles.side}>
              <div className={styles.card}>
                <button className="btn btn-ghost btn-full" style={{ marginBottom: 12 }}>Изменить</button>
                <button className="btn btn-outline btn-full" style={{ color: 'var(--c-danger)', borderColor: 'var(--c-danger)' }}>Закрыть без выполнения</button>
              </div>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Размещено проектов: 25</div>
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
