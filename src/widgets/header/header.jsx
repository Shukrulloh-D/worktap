import { Link, NavLink, useNavigate } from 'react-router-dom';
import { useState, useEffect, useRef } from 'react';
import { useAuth } from 'shared/lib/auth';
import { BellIcon, ChatIcon, ChevronDown } from 'shared/ui/icon';
import { IMAGES } from 'shared/config/images';

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

  // Закрываем меню при клике ВНЕ его
  useEffect(() => {
    const handler = (e) => {
      if (menuRef.current && !menuRef.current.contains(e.target)) setMenu(false);
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, []);

  return (
    <header style={{ background: 'white', borderBottom: '1px solid #F0F0F0', position: 'sticky', top: 0, zIndex: 100 }}>
      <div style={{ maxWidth: 1230, margin: '0 auto', padding: '0 20px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', height: 80 }}>

        {/* Логотип — замени /logo.svg на своё */}
        <Link to="/" style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
          <img src="/logo.svg" alt="WorkTap" style={{ height: 36 }} />
          <span style={{ fontSize: 20, fontWeight: 800 }}>worktap</span>
        </Link>

        {/* Навигация */}
        <nav style={{ display: 'flex', gap: 28, fontSize: 14, fontWeight: 500 }}>
          {NAV.map(i => (
            <NavLink key={i.to} to={i.to} style={({ isActive }) => ({ color: isActive ? '#21B349' : '#1F1F1F' })}>
              {i.label}
            </NavLink>
          ))}
        </nav>

        {/* Правая часть */}
        {user ? (
          <div style={{ display: 'flex', gap: 12, alignItems: 'center' }}>
            <button onClick={() => nav('/works')} style={{ color: '#B8B8B8', background: 'none', border: 'none', cursor: 'pointer', padding: 6 }}><BellIcon /></button>
            <button onClick={() => nav('/chat')} style={{ color: '#B8B8B8', background: 'none', border: 'none', cursor: 'pointer', padding: 6 }}><ChatIcon /></button>

            <div ref={menuRef} style={{ position: 'relative' }}>
              <div
                onClick={() => setMenu(!menu)}
                style={{ display: 'flex', gap: 8, alignItems: 'center', cursor: 'pointer', padding: '4px 8px', borderRadius: 8, background: menu ? '#F5F5F7' : 'transparent' }}
              >
                <span style={{ fontSize: 14, fontWeight: 600 }}>{user.name}</span>
                <img src={user.avatar} alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
                <ChevronDown />
              </div>

              {menu && (
                <div style={{ position: 'absolute', top: 56, right: 0, background: 'white', boxShadow: '0 10px 40px rgba(0,0,0,0.15)', borderRadius: 12, padding: 8, minWidth: 220, zIndex: 200 }}>
                  <div style={{ padding: '8px 12px', fontSize: 12, color: '#8B8B8B' }}>Личный кабинет</div>
                  {[
                    ['/profile', 'Мой профиль'],
                    ['/my-orders', 'Мои заказы'],
                    ['/purchases', 'История покупок'],
                    ['/favorites', 'Избранные ворки'],
                    ['/wallet', 'Мой кошелек'],
                  ].map(([to, label]) => (
                    <Link key={to} to={to} onClick={() => setMenu(false)} style={{ display: 'block', padding: '10px 12px', fontSize: 14, borderRadius: 8 }}>{label}</Link>
                  ))}
                  <div style={{ borderTop: '1px solid #F0F0F0', margin: '6px 0' }} />
                  <button onClick={() => { setMenu(false); logout(); nav('/'); }} style={{ display: 'block', padding: '10px 12px', fontSize: 14, color: '#F04438', width: '100%', textAlign: 'left', background: 'none', border: 'none', cursor: 'pointer', borderRadius: 8 }}>
                    Выйти из аккаунта
                  </button>
                </div>
              )}
            </div>
          </div>
        ) : (
          // НЕ залогинен — показываем Регистрация и Войти
          <div style={{ display: 'flex', gap: 12, alignItems: 'center' }}>
            <button onClick={() => onOpenAuth('login')} style={{ fontSize: 14, fontWeight: 600, background: 'none', border: 'none', cursor: 'pointer', color: '#1F1F1F', padding: '8px 12px' }}>
              Регистрация
            </button>
            <button onClick={() => onOpenAuth('login')} style={{ padding: '10px 24px', background: '#21B349', color: 'white', borderRadius: 8, fontWeight: 600, fontSize: 14, border: 'none', cursor: 'pointer' }}>
              Войти
            </button>
          </div>
        )}
      </div>
    </header>
  );
};
