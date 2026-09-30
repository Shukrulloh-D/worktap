import { Link, NavLink, useNavigate } from 'react-router-dom';
import { useState, useEffect, useRef } from 'react';
import { useAuth } from 'shared/lib/auth';
import { BellIcon, ChatIcon, ChevronDown } from 'shared/ui/icon';
import { IMAGES } from 'shared/config/images';
import styles from './header.module.css';

const NAV = [
  { to: '/exchange', label: 'Биржа' },
  { to: '/works', label: 'Ворки' },
  { to: '/contests', label: 'Конкурсы' },
  { to: '/create-work', label: 'Создать ворк' },
  { to: '/create-order', label: 'Создать заказ' },
];

export const Header = ({ onOpenAuth }) => {
  const nav = useNavigate();
  const { user, logout } = useAuth();
  const [menu, setMenu] = useState(false);
  const menuRef = useRef(null);

  useEffect(() => {
    const handler = (e) => {
      if (menuRef.current && !menuRef.current.contains(e.target)) setMenu(false);
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, []);

  return (
    <header className={styles.header}>
      <div className={styles.inner}>
        <Link to="/" className={styles.logo}>
          <img src={IMAGES.logo} alt="WorkTap" />
          <span className={styles.logoText}>worktap</span>
        </Link>

        <nav className={styles.nav}>
          {NAV.map(i => (
            <NavLink key={i.to} to={i.to} className={({ isActive }) => isActive ? styles.active : ''}>
              {i.label}
            </NavLink>
          ))}
        </nav>

        {user ? (
          <div className={styles.actions}>
            <button className={styles.iconBtn} onClick={() => nav('/works')}><BellIcon /></button>
            <button className={styles.iconBtn} onClick={() => nav('/chat')}><ChatIcon /></button>
            <div ref={menuRef} style={{ position: 'relative' }}>
              <div className={styles.userBtn} onClick={() => setMenu(!menu)}>
                <span className={styles.userName}>{user.name}</span>
                <img src={user.avatar} alt="" className={styles.userAvatar} />
                <ChevronDown />
              </div>
              {menu && (
                <div className={styles.menu}>
                  <div className={styles.menuLabel}>Личный кабинет</div>
                  {[
                    ['/profile', 'Мой профиль'],
                    ['/my-orders', 'Мои заказы'],
                    ['/purchases', 'История покупок'],
                    ['/favorites', 'Избранные ворки'],
                    ['/wallet', 'Мой кошелек'],
                  ].map(([to, label]) => (
                    <Link key={to} to={to} onClick={() => setMenu(false)} className={styles.menuLink}>{label}</Link>
                  ))}
                  <div className={styles.menuDivider} />
                  <button className={styles.logout} onClick={() => { setMenu(false); logout(); nav('/'); }}>
                    Выйти из аккаунта
                  </button>
                </div>
              )}
            </div>
          </div>
        ) : (
          <div className={styles.actions}>
            <button className={styles.authBtn} onClick={() => onOpenAuth('login')}>Регистрация</button>
            <button className="btn btn-primary" onClick={() => onOpenAuth('login')}>Войти</button>
          </div>
        )}
      </div>
    </header>
  );
};
