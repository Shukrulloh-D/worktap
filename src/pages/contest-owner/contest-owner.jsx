import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './contest-owner.module.css';

export const ContestOwnerPage = () => {
  const toast = useToast();
  const participants = Array(5).fill(null).map((_, i) => ({ id: i + 1, name: 'Никита Евреев' }));
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать рекламный баннер</h1>
              <div className={styles.meta}><strong>100 000 тенге</strong><span>до 14.07.2021</span></div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis.</p>

              <h3 style={{ fontSize: 18, fontWeight: 700, marginTop: 32, marginBottom: 16 }}>Работы участников</h3>
              {participants.map(p => (
                <div key={p.id} className={styles.participant}>
                  <div className={styles.pHead}>
                    <div style={{ width: 48, height: 48, borderRadius: '50%', background: '#E5E5E5' }} />
                    <div style={{ fontWeight: 700 }}>{p.name}</div>
                  </div>
                  <div style={{ display: 'flex', gap: 2, marginBottom: 8 }}>
                    {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                  </div>
                  <p style={{ fontSize: 13, color: 'var(--c-gray)', marginBottom: 12, lineHeight: 1.6 }}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus tincidunt eget eu, eget commodo condimentum non, fringilla fermentum.</p>
                  <div className={styles.workImages}>
                    <img src={IMAGES.workImage1} alt="" />
                    <img src={IMAGES.workImage2} alt="" />
                    <img src={IMAGES.workImage3} alt="" />
                  </div>
                  <div className={styles.actions}>
                    <button className={styles.accept} onClick={() => toast('Победитель выбран!')}>Выбрать</button>
                    <button className={styles.decline} onClick={() => toast('Отклонено')}>Отклонить</button>
                  </div>
                </div>
              ))}
            </div>
            <aside className={styles.side}>
              <div className={styles.card}>
                <button className="btn btn-ghost btn-full">Изменить</button>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
