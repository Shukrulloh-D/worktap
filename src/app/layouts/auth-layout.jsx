import { Outlet } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import styles from './auth-layout.module.css';

export const AuthLayout = () => (
  <div className={styles.wrap}>
    <div className={styles.left}>
      <div className={styles.logo}>
        <img src={IMAGES.logo} alt="WorkTap" />
        <span className={styles.logoText}>worktap</span>
      </div>
      <Outlet />
    </div>
    <div className={styles.right}>
      {/* ЗАМЕНИ КАРТИНКУ В IMAGES.authBg */}
      <div className={styles.bg} style={{ backgroundImage: `url(${IMAGES.authBg})` }} />
      <div className={styles.tip}>WorkTap — это маркетплейс фриланс услуг, где можно купить услугу как товар в магазине или создать индивидуальный заказ на бирже.</div>
      <div className={styles.dots}>
        <span className={`${styles.dot} ${styles.dotActive}`} />
        <span className={styles.dot} />
        <span className={styles.dot} />
        <span className={styles.dot} />
      </div>
    </div>
  </div>
);
