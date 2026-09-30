#!/bin/bash

echo "[1] Обновляем глобальный index.css"
cat > src/app/styles/index.css << 'ENDCSS'
:root {
  --primary: #21B349;
  --primary-dark: #1A8F3B;
  --primary-light: #E8F7EC;
  --peach: #FBA457;
  --peach-light: #FFE4CC;
  --yellow: #FFC700;
  --purple: #7C6FE0;
  --dark: #1F1F1F;
  --gray: #8B8B8B;
  --gray-light: #B8B8B8;
  --bg: #F5F5F7;
  --border: #E5E5E5;
  --danger: #F04438;
  --radius: 12px;
  --radius-sm: 8px;
  --radius-pill: 999px;
  --shadow-sm: 0 4px 20px rgba(0,0,0,0.03);
  --shadow-md: 0 10px 40px rgba(0,0,0,0.1);
  --transition: 0.2s ease;
}

* { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }
body {
  font-family: 'Inter', system-ui, sans-serif;
  background: #fff;
  color: var(--dark);
  font-size: 15px;
  line-height: 1.5;
  -webkit-font-smoothing: antialiased;
}
a { color: inherit; text-decoration: none; }
button { font-family: inherit; cursor: pointer; border: none; background: transparent; }
input, textarea, select { font-family: inherit; font-size: inherit; outline: none; }
img { max-width: 100%; display: block; }
ul { list-style: none; }

/* ==== Layout ==== */
.container { max-width: 1230px; margin: 0 auto; padding: 0 20px; }
.section { padding: 60px 0; }
.section-sm { padding: 40px 0; }
.section-lg { padding: 80px 0; }

.section-title { font-size: 32px; font-weight: 800; letter-spacing: -0.5px; margin-bottom: 24px; }
.section-title-sm { font-size: 20px; font-weight: 700; margin-bottom: 20px; }

.text-center { text-align: center; }
.text-muted { color: var(--gray); }
.text-primary { color: var(--primary); }
.text-peach { color: var(--peach); }

/* ==== Buttons ==== */
.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: 8px;
  padding: 12px 24px; border-radius: var(--radius-sm);
  font-weight: 600; font-size: 14px; transition: all var(--transition);
  white-space: nowrap; cursor: pointer; border: none;
}
.btn:active { transform: scale(0.98); }
.btn-primary { background: var(--primary); color: white; }
.btn-primary:hover { background: var(--primary-dark); }
.btn-peach { background: var(--peach); color: white; }
.btn-peach:hover { background: #E8944A; }
.btn-outline { background: white; border: 1.5px solid var(--primary); color: var(--primary); }
.btn-outline:hover { background: var(--primary); color: white; }
.btn-ghost { background: transparent; color: var(--dark); border: 1px solid var(--border); }
.btn-ghost:hover { border-color: var(--primary); color: var(--primary); }
.btn-light { background: var(--bg); color: var(--dark); }
.btn-light:hover { background: #EAEAEC; }
.btn-full { width: 100%; }
.btn-sm { padding: 8px 16px; font-size: 13px; }
.btn-lg { padding: 16px 32px; font-size: 15px; }

/* ==== Inputs ==== */
.input {
  padding: 12px 16px; border: 1.5px solid var(--border);
  border-radius: var(--radius-sm); font-size: 14px; width: 100%;
  transition: border-color var(--transition); background: white; color: var(--dark);
}
.input:focus { border-color: var(--primary); }
.input::placeholder { color: var(--gray-light); }

/* ==== Cards ==== */
.card {
  background: white; border-radius: var(--radius); padding: 24px;
  border: 1px solid #F0F0F0;
}
.card-lift { transition: transform var(--transition), box-shadow var(--transition); }
.card-lift:hover { transform: translateY(-4px); box-shadow: var(--shadow-md); }

/* ==== Grid ==== */
.grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 24px; }
.grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
.grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }

/* ==== Badges ==== */
.badge {
  display: inline-flex; align-items: center; gap: 4px;
  padding: 3px 10px; border-radius: 6px;
  font-size: 12px; font-weight: 600;
}
.badge-green { background: var(--primary-light); color: var(--primary); }
.badge-peach { background: var(--peach-light); color: var(--peach); }

/* ==== Avatar ==== */
.avatar { border-radius: 50%; object-fit: cover; }
.avatar-sm { width: 32px; height: 32px; }
.avatar-md { width: 40px; height: 40px; }
.avatar-lg { width: 64px; height: 64px; }

/* ==== Stars ==== */
.stars { display: inline-flex; gap: 2px; color: #FFB800; }

/* ==== Toast ==== */
.toast {
  position: fixed; bottom: 30px; right: 30px;
  background: var(--dark); color: white; padding: 14px 22px;
  border-radius: var(--radius-sm); font-size: 14px; font-weight: 500;
  box-shadow: 0 20px 40px rgba(0,0,0,0.2); z-index: 9999;
  animation: slideInRight 0.3s ease;
}

/* ==== Animations ==== */
@keyframes fadeIn { from { opacity: 0; transform: translateY(15px); } to { opacity: 1; transform: translateY(0); } }
@keyframes fadeInScale { from { opacity: 0; transform: scale(0.96); } to { opacity: 1; transform: scale(1); } }
@keyframes slideInRight { from { opacity: 0; transform: translateX(30px); } to { opacity: 1; transform: translateX(0); } }

.pageFadeIn { animation: fadeIn 0.35s ease; }

/* ==== Responsive ==== */
@media (max-width: 1024px) {
  .grid-4 { grid-template-columns: repeat(2, 1fr); }
  .grid-3 { grid-template-columns: repeat(2, 1fr); }
}
@media (max-width: 700px) {
  .grid-4, .grid-3, .grid-2 { grid-template-columns: 1fr; }
  .section { padding: 40px 0; }
  .section-title { font-size: 24px; }
}
ENDCSS

echo "[2] Каталог стилей для страниц и виджетов"
mkdir -p src/pages/home
mkdir -p src/widgets/header
mkdir -p src/widgets/footer
mkdir -p src/widgets/home-sections/hero
mkdir -p src/widgets/home-sections/active-works

echo "[3] Header — стили отдельно"
cat > src/widgets/header/header.module.css << 'ENDCSS'
.header {
  background: white;
  border-bottom: 1px solid #F0F0F0;
  position: sticky;
  top: 0;
  z-index: 100;
}
.inner {
  max-width: 1230px;
  margin: 0 auto;
  padding: 0 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 80px;
}
.logo { display: flex; align-items: center; gap: 8px; }
.logo img { height: 36px; }
.logoText { font-size: 20px; font-weight: 800; }

.nav { display: flex; gap: 28px; font-size: 14px; font-weight: 500; }
.nav a { color: var(--dark); transition: color 0.2s; }
.nav a:hover, .nav a.active { color: var(--primary); }

.actions { display: flex; gap: 12px; align-items: center; }
.iconBtn {
  color: var(--gray-light);
  background: none;
  border: none;
  cursor: pointer;
  padding: 6px;
  display: flex;
  align-items: center;
}
.iconBtn:hover { color: var(--primary); }

.userBtn {
  display: flex;
  gap: 8px;
  align-items: center;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: var(--radius-sm);
  transition: background var(--transition);
}
.userBtn:hover { background: var(--bg); }
.userName { font-size: 14px; font-weight: 600; }
.userAvatar { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }

.menu {
  position: absolute;
  top: 56px;
  right: 0;
  background: white;
  box-shadow: var(--shadow-md);
  border-radius: var(--radius);
  padding: 8px;
  min-width: 220px;
  z-index: 200;
}
.menuLabel { padding: 8px 12px; font-size: 12px; color: var(--gray); }
.menuLink {
  display: block;
  padding: 10px 12px;
  font-size: 14px;
  border-radius: var(--radius-sm);
}
.menuLink:hover { background: var(--bg); }
.menuDivider { border-top: 1px solid #F0F0F0; margin: 6px 0; }
.logout {
  display: block;
  padding: 10px 12px;
  font-size: 14px;
  color: var(--danger);
  width: 100%;
  text-align: left;
  background: none;
  border: none;
  cursor: pointer;
  border-radius: var(--radius-sm);
}
.logout:hover { background: #FEF2F2; }

/* Не залогинен */
.authBtn {
  font-size: 14px;
  font-weight: 600;
  background: none;
  border: none;
  cursor: pointer;
  color: var(--dark);
  padding: 8px 12px;
}
.authBtn:hover { color: var(--primary); }

@media (max-width: 1024px) {
  .nav { display: none; }
}
ENDCSS

cat > src/widgets/header/header.jsx << 'ENDJSX'
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
        {/* ЛОГОТИП — картинка из IMAGES.logo */}
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
                {/* АВАТАР — user.avatar из AuthContext */}
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
                    <Link key={to} to={to} onClick={() => setMenu(false)} className={styles.menuLink}>
                      {label}
                    </Link>
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
ENDJSX

echo "[4] Footer — стили отдельно"
cat > src/widgets/footer/footer.module.css << 'ENDCSS'
.footer { background: var(--bg); padding-top: 60px; margin-top: 80px; }
.inner {
  max-width: 1230px; margin: 0 auto; padding: 0 20px;
  display: grid; grid-template-columns: repeat(4, 1fr); gap: 40px;
}
.colTitle { font-size: 16px; font-weight: 700; margin-bottom: 16px; }
.link { display: block; font-size: 13px; color: var(--gray); padding: 6px 0; transition: color 0.2s; }
.link:hover { color: var(--primary); }
.socials { display: flex; gap: 12px; margin-top: 12px; }
.social {
  width: 40px; height: 40px; border-radius: 50%; background: var(--dark);
  display: flex; align-items: center; justify-content: center;
  color: white; font-size: 16px; font-weight: 700; transition: background 0.2s;
}
.social:hover { background: var(--primary); }
.bottom {
  max-width: 1230px; margin: 40px auto 0; padding: 24px 20px;
  border-top: 1px solid var(--border); text-align: center;
  font-size: 13px; color: var(--gray);
}
@media (max-width: 700px) { .inner { grid-template-columns: 1fr 1fr; } }
ENDCSS

cat > src/widgets/footer/footer.jsx << 'ENDJSX'
import { Link } from 'react-router-dom';
import styles from './footer.module.css';

const COLUMNS = [
  { title: 'Топ категории', links: ['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','Соцсети и реклама','Бизнес и жизнь','SEO и оптимизация'] },
  { title: 'О Проекте', links: ['О Нас','Как Это Работает','Политика Приватности','Правила Пользования','Пресса о нас'] },
  { title: 'Поддержка', links: ['Контакты','Политика Безопасности','FAQ'] },
];

export const Footer = () => (
  <footer className={styles.footer}>
    <div className={styles.inner}>
      {COLUMNS.map(col => (
        <div key={col.title}>
          <h4 className={styles.colTitle}>{col.title}</h4>
          {col.links.map(l => <Link key={l} to="/" className={styles.link}>{l}</Link>)}
        </div>
      ))}
      <div>
        <h4 className={styles.colTitle}>Follow</h4>
        <div className={styles.socials}>
          {['f','t','i','in'].map((s, i) => (
            <a key={i} href="/" className={styles.social} style={i === 1 ? { background: 'var(--primary)' } : {}}>{s}</a>
          ))}
        </div>
      </div>
    </div>
    <div className={styles.bottom}>
      Copyright @ 2021 | WorkTap - Worktap.KZ. All Rights Reserved
    </div>
  </footer>
);
ENDJSX

echo "[5] Hero главной — стили отдельно"
cat > src/widgets/home-sections/hero/hero.module.css << 'ENDCSS'
.section {
  background: linear-gradient(135deg, #FFF5EB 0%, #FFF 60%);
  padding: 60px 0 100px;
}
.inner {
  max-width: 1230px; margin: 0 auto; padding: 0 20px;
  display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;
}
.title { font-size: 44px; font-weight: 800; line-height: 1.15; margin-bottom: 16px; letter-spacing: -1px; }
.highlight { color: var(--primary); }
.searchRow { display: flex; gap: 8px; margin-bottom: 20px; max-width: 520px; }
.searchRow input { flex: 1; }
.searchRow button { padding: 12px 32px; }

.tags { display: flex; gap: 12px; flex-wrap: wrap; font-size: 13px; }
.tag { background: none; border: none; cursor: pointer; color: var(--gray); font-size: 13px; }
.tag:hover { color: var(--primary); }
.tagAll {
  padding: 4px 12px; border: 1px solid var(--peach); border-radius: 20px;
  color: var(--peach); background: none; cursor: pointer;
  font-size: 12px; font-weight: 600;
}

/* Правая часть — круглая картинка */
.avatarWrap { position: relative; text-align: center; }
.avatarCircle {
  width: 380px; height: 380px; border-radius: 50%; background: var(--peach-light);
  margin: 0 auto; display: flex; align-items: center; justify-content: center;
  position: relative;
}
.avatarCircle img { width: 260px; height: 260px; border-radius: 50%; object-fit: cover; }
.ratingBadge {
  position: absolute; bottom: 60px; right: -10px; background: white;
  padding: 8px 16px; border-radius: var(--radius); box-shadow: var(--shadow-md);
  display: flex; gap: 4px;
}
.ratingBadge span { color: #FFB800; font-size: 18px; }

@media (max-width: 900px) {
  .inner { grid-template-columns: 1fr; gap: 40px; }
  .title { font-size: 30px; }
  .avatarWrap { display: none; }
}
ENDCSS

cat > src/widgets/home-sections/hero/hero.jsx << 'ENDJSX'
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import styles from './hero.module.css';

const TAGS = ['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'];

export const Hero = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className={styles.inner}>
        <div>
          <h1 className={styles.title}>
            Ищите и находите подходящую работу среди <span className={styles.highlight}>10,000+</span> проектов и покажите на что Вы способны!
          </h1>
          <div className={styles.searchRow}>
            <input className="input" placeholder="Какую работу ищете?" />
            <button className="btn btn-peach">Найти</button>
          </div>
          <div className={styles.tags}>
            {TAGS.map(c => (
              <button key={c} className={styles.tag} onClick={() => nav(`/exchange?cat=${c}`)}>{c}</button>
            ))}
            <button className={styles.tagAll} onClick={() => nav('/exchange')}>Все категории</button>
          </div>
        </div>

        {/* ЗАМЕНИ КАРТИНКУ В IMAGES.heroAvatar */}
        <div className={styles.avatarWrap}>
          <div className={styles.avatarCircle}>
            <img src={IMAGES.heroAvatar} alt="Hero" />
            <div className={styles.ratingBadge}>
              {[1,2,3,4,5].map(i => <span key={i}>★</span>)}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
ENDJSX

echo "[6] Проверка"
echo ""
echo "Пустые папки:"
find src -type d -empty
echo ""
echo "ГОТОВО"
