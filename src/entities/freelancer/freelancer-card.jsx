import { useNavigate } from 'react-router-dom';
import { StarIcon } from 'shared/ui/icon';
import styles from './freelancer-card.module.css';

export const FreelancerCard = ({ freelancer }) => {
  const nav = useNavigate();
  return (
    <div className={styles.card}>
      <div className={styles.head}>
        <img src={freelancer.avatar} alt="" className={styles.avatar} />
        <div>
          <div className={styles.name}>{freelancer.name}</div>
          <div className={styles.role}>{freelancer.role}</div>
          <div className={styles.projects}>Выполнено проектов: {freelancer.projects}</div>
        </div>
      </div>
      <div className={styles.stars}>
        {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= freelancer.rating} size={16} />)}
      </div>
      <button className={styles.btn} onClick={() => nav('/chat')}>Написать</button>
    </div>
  );
};
