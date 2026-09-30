import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import styles from './helps-business.module.css';

const CARDS = [
  { icon: '💳', text: 'Оплачивайте с р/с или карты компании' },
  { icon: '💰', text: 'Экономьте до 87% бюджета на фрилансе' },
  { icon: '⏱', text: 'Экономьте до 75% времени на решении фриланс задач' },
];

export const HelpsBusiness = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className={styles.inner}>
        <div>
          <h2 className={styles.title}>Как WorkTap помогает бизнесу?</h2>
          {CARDS.map((c, i) => (
            <div key={i} className={styles.card}>
              <span className={styles.cardIcon}>{c.icon}</span>
              <span className={styles.cardText}>{c.text}</span>
            </div>
          ))}
          <h3 className={styles.bigText}>WorkTap — быстро, просто и безопасно!</h3>
          <button className={styles.btnStart} onClick={() => nav('/exchange')}>Начать!</button>
        </div>
        <div className={styles.image}>
          <img src={IMAGES.helpsBusiness} alt="Helps" />
        </div>
      </div>
    </section>
  );
};
