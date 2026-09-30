import { StarIcon } from 'shared/ui/icon';
import styles from './review-card.module.css';

export const ReviewCard = ({ review }) => (
  <div className={styles.card}>
    <div className={styles.head}>
      <div className={styles.avatar} />
      <div className={styles.author}>{review.author}</div>
    </div>
    <div className={styles.stars}>
      {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= review.rating} size={14} />)}
    </div>
    <p className={styles.text}>{review.text}</p>
  </div>
);
