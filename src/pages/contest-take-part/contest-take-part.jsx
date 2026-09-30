import { IMAGES } from 'shared/config/images';
import { useToast } from 'shared/lib/toast';
import styles from './contest-take-part.module.css';

export const ContestTakePartPage = () => {
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container" style={{ maxWidth: 700 }}>
          <h1 className={styles.title}>Принять участие</h1>
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
      </section>
    </div>
  );
};
