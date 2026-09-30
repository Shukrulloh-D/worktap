import styles from './work-card.module.css';

export const WorkCard = ({ work, variant, onOrder }) => (
  <div className={`${styles.card} ${variant === 'highlight' ? styles.cardHighlight : ''}`}>
    <div className={styles.head}>
      <img src={work.avatar} alt="" className={styles.avatar} />
      <div className={styles.author}>{work.author}</div>
    </div>
    <div className={styles.title}>{work.title}</div>
    <p className={styles.desc}>{work.desc}</p>
    <button className={styles.btn} onClick={onOrder}>Посмотреть</button>
  </div>
);
