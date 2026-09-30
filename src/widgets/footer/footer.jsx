import { Link } from 'react-router-dom';
import styles from './footer.module.css';

const COLS = [
  { t: 'Топ категории', links: ['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','Соцсети и реклама','Бизнес и жизнь','SEO и оптимизация'] },
  { t: 'О Проекте', links: ['О Нас','Как Это Работает','Политика Приватности','Правила Пользования','Пресса о нас'] },
  { t: 'Поддержка', links: ['Контакты','Политика Безопасности','FAQ'] },
];

export const Footer = () => (
  <footer className={styles.footer}>
    <div className={styles.inner}>
      {COLS.map(col => (
        <div key={col.t}>
          <h4 className={styles.colTitle}>{col.t}</h4>
          {col.links.map(l => <Link key={l} to="/" className={styles.link}>{l}</Link>)}
        </div>
      ))}
      <div>
        <h4 className={styles.colTitle}>Follow</h4>
        <div className={styles.socials}>
          {['f','t','i','in'].map((s, i) => (
            <a key={i} href="/" className={`${styles.social} ${i === 1 ? styles.active : ''}`}>{s}</a>
          ))}
        </div>
      </div>
    </div>
    <div className={styles.bottom}>Copyright @ 2021 | WorkTap - Worktap.KZ. All Rights Reserved</div>
  </footer>
);
