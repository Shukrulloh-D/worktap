mkdir -p src/app/styles
mkdir -p src/widgets/header src/widgets/footer
mkdir -p src/widgets/home-sections/{hero,categories,active-works,top-freelancers,how-to-solve,helps-business}

# ================= GLOBAL CSS =================
cat > src/app/styles/index.css << 'END'
:root {
  --c-primary: #21B349;
  --c-primary-d: #1A8F3B;
  --c-primary-l: #E8F7EC;
  --c-peach: #FBA457;
  --c-peach-l: #FFE4CC;
  --c-yellow: #FFC700;
  --c-purple: #7C6FE0;
  --c-dark: #1F1F1F;
  --c-gray: #8B8B8B;
  --c-gray-l: #B8B8B8;
  --c-bg: #F5F5F7;
  --c-border: #E5E5E5;
  --c-danger: #F04438;
  --r-sm: 8px;
  --r: 12px;
  --r-lg: 16px;
  --r-pill: 999px;
  --sh-sm: 0 4px 20px rgba(0,0,0,0.03);
  --sh: 0 10px 40px rgba(0,0,0,0.1);
  --t: 0.2s ease;
}

* { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }
body {
  font-family: 'Inter', system-ui, sans-serif;
  color: var(--c-dark);
  background: #fff;
  font-size: 15px;
  line-height: 1.5;
  -webkit-font-smoothing: antialiased;
}
a { color: inherit; text-decoration: none; }
button { font-family: inherit; cursor: pointer; border: none; background: transparent; }
input, textarea, select { font-family: inherit; font-size: inherit; outline: none; }
img { max-width: 100%; display: block; }
ul { list-style: none; }

/* ===== LAYOUT ===== */
.container { max-width: 1230px; margin: 0 auto; padding: 0 20px; }
.section { padding: 60px 0; }
.section-lg { padding: 80px 0; }

/* ===== TYPO ===== */
.h1 { font-size: 44px; font-weight: 800; line-height: 1.15; letter-spacing: -1px; }
.h2 { font-size: 32px; font-weight: 800; letter-spacing: -0.5px; margin-bottom: 24px; }
.h3 { font-size: 22px; font-weight: 700; }
.h4 { font-size: 17px; font-weight: 700; }
.text { font-size: 14px; color: var(--c-gray); line-height: 1.6; }
.text-sm { font-size: 13px; color: var(--c-gray); }

/* ===== BUTTONS ===== */
.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: 8px;
  padding: 12px 24px; border-radius: var(--r-sm);
  font-weight: 600; font-size: 14px; transition: all var(--t);
  cursor: pointer; border: none; white-space: nowrap;
}
.btn:active { transform: scale(0.98); }
.btn-primary { background: var(--c-primary); color: #fff; }
.btn-primary:hover { background: var(--c-primary-d); }
.btn-peach { background: var(--c-peach); color: #fff; }
.btn-peach:hover { background: #E8944A; }
.btn-outline { background: #fff; border: 1.5px solid var(--c-primary); color: var(--c-primary); }
.btn-outline:hover { background: var(--c-primary); color: #fff; }
.btn-ghost { background: transparent; color: var(--c-dark); border: 1px solid var(--c-border); }
.btn-ghost:hover { border-color: var(--c-primary); color: var(--c-primary); }
.btn-light { background: var(--c-bg); color: var(--c-dark); }
.btn-light:hover { background: #EAEAEC; }
.btn-full { width: 100%; }
.btn-sm { padding: 8px 16px; font-size: 13px; }

/* ===== INPUT ===== */
.input {
  padding: 12px 16px; border: 1.5px solid var(--c-border);
  border-radius: var(--r-sm); font-size: 14px; width: 100%;
  transition: border-color var(--t); background: #fff; color: var(--c-dark);
}
.input:focus { border-color: var(--c-primary); }
.input::placeholder { color: var(--c-gray-l); }

/* ===== GRIDS ===== */
.grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 24px; }
.grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
.grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }

/* ===== CARD ===== */
.card {
  background: #fff; border-radius: var(--r); padding: 24px;
  border: 1px solid #F0F0F0;
}
.card-hover { transition: transform var(--t), box-shadow var(--t); }
.card-hover:hover { transform: translateY(-4px); box-shadow: var(--sh); }

/* ===== AVATAR ===== */
.avatar { border-radius: 50%; object-fit: cover; }
.avatar-sm { width: 32px; height: 32px; }
.avatar-md { width: 40px; height: 40px; }
.avatar-lg { width: 64px; height: 64px; }

/* ===== TOAST ===== */
.toast {
  position: fixed; bottom: 30px; right: 30px;
  background: var(--c-dark); color: #fff; padding: 14px 22px;
  border-radius: var(--r-sm); font-size: 14px; font-weight: 500;
  box-shadow: 0 20px 40px rgba(0,0,0,0.2); z-index: 9999;
  animation: slideInRight 0.3s ease;
}

@keyframes fadeIn { from { opacity: 0; transform: translateY(15px); } to { opacity: 1; transform: translateY(0); } }
@keyframes fadeInScale { from { opacity: 0; transform: scale(0.96); } to { opacity: 1; transform: scale(1); } }
@keyframes slideInRight { from { opacity: 0; transform: translateX(30px); } to { opacity: 1; transform: translateX(0); } }

.pageFadeIn { animation: fadeIn 0.35s ease; }

@media (max-width: 1024px) {
  .grid-4 { grid-template-columns: repeat(2, 1fr); }
  .grid-3 { grid-template-columns: repeat(2, 1fr); }
}
@media (max-width: 700px) {
  .grid-4, .grid-3, .grid-2 { grid-template-columns: 1fr; }
  .h1 { font-size: 30px; }
  .h2 { font-size: 24px; }
}
END

# ================= HEADER =================
cat > src/widgets/header/header.module.css << 'END'
.header { background: #fff; border-bottom: 1px solid #F0F0F0; position: sticky; top: 0; z-index: 100; }
.inner {
  max-width: 1230px; margin: 0 auto; padding: 0 20px;
  display: flex; justify-content: space-between; align-items: center; height: 80px;
}
.logo { display: flex; align-items: center; gap: 8px; }
.logo img { height: 36px; }
.logoText { font-size: 20px; font-weight: 800; }

.nav { display: flex; gap: 28px; font-size: 14px; font-weight: 500; }
.nav a { color: var(--c-dark); transition: color 0.2s; }
.nav a:hover, .nav a.active { color: var(--c-primary); }

.actions { display: flex; gap: 12px; align-items: center; }
.iconBtn {
  color: var(--c-gray-l); background: none; border: none;
  cursor: pointer; padding: 6px; display: flex; align-items: center;
}
.iconBtn:hover { color: var(--c-primary); }

.userBtn {
  display: flex; gap: 8px; align-items: center;
  cursor: pointer; padding: 4px 8px;
  border-radius: var(--r-sm); transition: background var(--t);
}
.userBtn:hover { background: var(--c-bg); }
.userName { font-size: 14px; font-weight: 600; }
.userAvatar { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }

.menu {
  position: absolute; top: 56px; right: 0;
  background: #fff; box-shadow: var(--sh);
  border-radius: var(--r); padding: 8px;
  min-width: 220px; z-index: 200;
}
.menuLabel { padding: 8px 12px; font-size: 12px; color: var(--c-gray); }
.menuLink {
  display: block; padding: 10px 12px;
  font-size: 14px; border-radius: var(--r-sm);
}
.menuLink:hover { background: var(--c-bg); }
.menuDivider { border-top: 1px solid #F0F0F0; margin: 6px 0; }
.logout {
  display: block; padding: 10px 12px;
  font-size: 14px; color: var(--c-danger);
  width: 100%; text-align: left;
  background: none; border: none; cursor: pointer;
  border-radius: var(--r-sm);
}
.logout:hover { background: #FEF2F2; }

.authBtn {
  font-size: 14px; font-weight: 600;
  background: none; border: none;
  cursor: pointer; color: var(--c-dark);
  padding: 8px 12px;
}
.authBtn:hover { color: var(--c-primary); }

@media (max-width: 1024px) { .nav { display: none; } }
END

cat > src/widgets/header/header.jsx << 'END'
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
END

# ================= FOOTER =================
cat > src/widgets/footer/footer.module.css << 'END'
.footer { background: var(--c-bg); padding-top: 60px; margin-top: 80px; }
.inner {
  max-width: 1230px; margin: 0 auto; padding: 0 20px;
  display: grid; grid-template-columns: repeat(4, 1fr); gap: 40px;
}
.colTitle { font-size: 16px; font-weight: 700; margin-bottom: 16px; }
.link { display: block; font-size: 13px; color: var(--c-gray); padding: 6px 0; transition: color 0.2s; }
.link:hover { color: var(--c-primary); }
.socials { display: flex; gap: 12px; margin-top: 12px; }
.social {
  width: 40px; height: 40px; border-radius: 50%; background: var(--c-dark);
  display: flex; align-items: center; justify-content: center;
  color: #fff; font-size: 16px; font-weight: 700; transition: background 0.2s;
}
.social:hover { background: var(--c-primary); }
.social.active { background: var(--c-primary); }
.bottom {
  max-width: 1230px; margin: 40px auto 0; padding: 24px 20px;
  border-top: 1px solid var(--c-border); text-align: center;
  font-size: 13px; color: var(--c-gray);
}
@media (max-width: 700px) { .inner { grid-template-columns: 1fr 1fr; } }
END

cat > src/widgets/footer/footer.jsx << 'END'
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
END

# ================= HERO =================
cat > src/widgets/home-sections/hero/hero.module.css << 'END'
.section { background: linear-gradient(135deg, #FFF5EB 0%, #FFF 60%); padding: 60px 0 100px; }
.inner { max-width: 1230px; margin: 0 auto; padding: 0 20px; display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center; }
.title { font-size: 44px; font-weight: 800; line-height: 1.15; margin-bottom: 16px; letter-spacing: -1px; }
.hl { color: var(--c-primary); }
.searchRow { display: flex; gap: 8px; margin-bottom: 20px; max-width: 520px; }
.searchRow input { flex: 1; }
.searchRow .btn { padding: 12px 32px; }
.tags { display: flex; gap: 12px; flex-wrap: wrap; font-size: 13px; }
.tag { background: none; border: none; cursor: pointer; color: var(--c-gray); font-size: 13px; padding: 0; }
.tag:hover { color: var(--c-primary); }
.tagAll {
  padding: 4px 12px; border: 1px solid var(--c-peach); border-radius: 20px;
  color: var(--c-peach); background: none; cursor: pointer;
  font-size: 12px; font-weight: 600;
}
.right { position: relative; text-align: center; }
.circle {
  width: 380px; height: 380px; border-radius: 50%; background: var(--c-peach-l);
  margin: 0 auto; display: flex; align-items: center; justify-content: center;
  position: relative;
}
.circle img { width: 260px; height: 260px; border-radius: 50%; object-fit: cover; }
.rating {
  position: absolute; bottom: 60px; right: -10px;
  background: #fff; padding: 8px 16px; border-radius: var(--r);
  box-shadow: var(--sh); display: flex; gap: 4px;
}
.rating span { color: #FFB800; font-size: 18px; }
@media (max-width: 900px) {
  .inner { grid-template-columns: 1fr; gap: 40px; }
  .title { font-size: 30px; }
  .right { display: none; }
}
END

cat > src/widgets/home-sections/hero/hero.jsx << 'END'
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
            Ищите и находите подходящую работу среди <span className={styles.hl}>10,000+</span> проектов и покажите на что Вы способны!
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
        <div className={styles.right}>
          <div className={styles.circle}>
            <img src={IMAGES.heroAvatar} alt="Hero" />
            <div className={styles.rating}>
              {[1,2,3,4,5].map(i => <span key={i}>★</span>)}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
END

# ================= CATEGORIES =================
cat > src/widgets/home-sections/categories/categories.module.css << 'END'
.section { padding: 60px 0; }
.title { font-size: 16px; font-weight: 700; margin-bottom: 16px; }
.list { display: flex; gap: 12px; flex-wrap: wrap; }
.chip {
  padding: 8px 16px; border: 1px solid var(--c-border);
  border-radius: var(--r-sm); background: #fff;
  font-size: 13px; cursor: pointer; transition: all var(--t);
}
.chip:hover { border-color: var(--c-primary); color: var(--c-primary); }
.chipAll {
  padding: 8px 16px; border: 1px solid var(--c-peach);
  border-radius: var(--r-sm); color: var(--c-peach);
  background: #fff; font-size: 13px; font-weight: 600; cursor: pointer;
}
END

cat > src/widgets/home-sections/categories/categories.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { CATEGORIES } from 'shared/api/mocks';
import styles from './categories.module.css';

export const Categories = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className="container">
        <h3 className={styles.title}>Выберите рубрику, чтобы начать</h3>
        <div className={styles.list}>
          {CATEGORIES.map(c => (
            <button key={c.id} className={styles.chip} onClick={() => nav(`/exchange?cat=${c.name}`)}>{c.name}</button>
          ))}
          <button className={styles.chipAll} onClick={() => nav('/exchange')}>Все категории</button>
        </div>
      </div>
    </section>
  );
};
END

# ================= ACTIVE WORKS =================
cat > src/widgets/home-sections/active-works/active-works.module.css << 'END'
.section { padding: 40px 0; }
.grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
.more {
  background: #F5F0FF; border-radius: var(--r);
  display: flex; align-items: center; justify-content: center;
  cursor: pointer; min-height: 260px;
  font-weight: 700; font-size: 16px; color: var(--c-purple);
  transition: transform var(--t), box-shadow var(--t);
}
.more:hover { transform: translateY(-4px); box-shadow: var(--sh); }
@media (max-width: 900px) { .grid { grid-template-columns: 1fr; } }
END

cat > src/widgets/home-sections/active-works/active-works.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
import styles from './active-works.module.css';

export const ActiveWorks = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className="container">
        <h2 className="h2">Актуальные ворки</h2>
        <div className={styles.grid}>
          {ACTIVE_WORKS.map((w, i) => (
            <WorkCard key={w.id} work={w} variant={i === 1 ? 'highlight' : 'default'} onOrder={() => nav('/exchange')} />
          ))}
          <div className={styles.more} onClick={() => nav('/works')}>Смотреть все ворки</div>
        </div>
      </div>
    </section>
  );
};
END

# ================= TOP FREELANCERS =================
cat > src/widgets/home-sections/top-freelancers/top-freelancers.module.css << 'END'
.section { padding: 60px 0; }
.grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
.more {
  background: #F5F0FF; border-radius: var(--r);
  display: flex; align-items: center; justify-content: center;
  cursor: pointer; min-height: 230px;
  font-weight: 700; font-size: 15px; color: var(--c-purple);
  padding: 20px; text-align: center;
  transition: transform var(--t), box-shadow var(--t);
}
.more:hover { transform: translateY(-4px); box-shadow: var(--sh); }
@media (max-width: 900px) { .grid { grid-template-columns: 1fr; } }
END

cat > src/widgets/home-sections/top-freelancers/top-freelancers.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { FreelancerCard } from 'entities/freelancer';
import { FREELANCERS } from 'shared/api/mocks';
import styles from './top-freelancers.module.css';

export const TopFreelancers = () => {
  const nav = useNavigate();
  return (
    <section className={styles.section}>
      <div className="container">
        <h2 className="h2">Топ фрилансеров</h2>
        <div className={styles.grid}>
          {FREELANCERS.map(f => <FreelancerCard key={f.id} freelancer={f} />)}
          <div className={styles.more} onClick={() => nav('/exchange')}>Посмотреть всех ТОП фрилансеров</div>
        </div>
      </div>
    </section>
  );
};
END

# ================= HOW TO SOLVE =================
cat > src/widgets/home-sections/how-to-solve/how-to-solve.module.css << 'END'
.section { padding: 60px 0; background: #FAFAFA; }
.link { color: var(--c-primary); font-size: 14px; font-weight: 600; display: inline-block; margin-bottom: 32px; }
.grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 40px; }
.icon { font-size: 48px; margin-bottom: 16px; }
.title { font-size: 18px; font-weight: 700; margin-bottom: 12px; }
.text { font-size: 14px; color: var(--c-gray); line-height: 1.6; }
@media (max-width: 900px) { .grid { grid-template-columns: 1fr; } }
END

cat > src/widgets/home-sections/how-to-solve/how-to-solve.jsx << 'END'
import styles from './how-to-solve.module.css';

const STEPS = [
  { icon: '👤', title: 'Выберите услугу', text: 'В супермаркете WorkTap представлен широкий выбор услуг от квалифицированных специалистов.' },
  { icon: '💳', title: 'Оплатите', text: 'Деньги будут перечислены продавцу после того, как он выполнит работу, и вы её одобрите.' },
  { icon: '📄', title: 'Получите результат', text: 'Наш супермаркет гарантирует вам возврат средств в полном объёме в случае невыполнения заказа.' },
];

export const HowToSolve = () => (
  <section className={styles.section}>
    <div className="container">
      <h2 className="h2">Как решать задачи на WorkTap?</h2>
      <a href="/" className={styles.link}>Идеально подходит для бизнеса и частных лиц</a>
      <div className={styles.grid}>
        {STEPS.map((s, i) => (
          <div key={i}>
            <div className={styles.icon}>{s.icon}</div>
            <h3 className={styles.title}>{s.title}</h3>
            <p className={styles.text}>{s.text}</p>
          </div>
        ))}
      </div>
    </div>
  </section>
);
END

# ================= HELPS BUSINESS =================
cat > src/widgets/home-sections/helps-business/helps-business.module.css << 'END'
.section { background: var(--c-yellow); padding: 80px 0; }
.inner {
  max-width: 1230px; margin: 0 auto; padding: 0 20px;
  display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;
}
.title { font-size: 32px; font-weight: 800; margin-bottom: 24px; }
.card {
  background: #fff; padding: 20px; border-radius: var(--r);
  margin-bottom: 16px; display: flex; gap: 16px; align-items: center;
}
.cardIcon { font-size: 28px; }
.cardText { font-size: 14px; font-weight: 500; }
.bigText { font-size: 20px; font-weight: 800; margin-top: 32px; margin-bottom: 20px; }
.btnStart {
  background: var(--c-purple); color: #fff;
  padding: 14px 40px; border-radius: var(--r-sm);
  font-weight: 600; font-size: 14px; border: none; cursor: pointer;
}
.btnStart:hover { background: #6A5FD0; }
.image { text-align: center; }
.image img {
  width: 100%; max-width: 500px;
  border-radius: var(--r-lg);
  box-shadow: 0 30px 80px rgba(0,0,0,0.3);
}
@media (max-width: 900px) { .inner { grid-template-columns: 1fr; gap: 40px; } }
END

cat > src/widgets/home-sections/helps-business/helps-business.jsx << 'END'
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
END

# ================= PAGES/HOME =================
cat > src/pages/home/home.jsx << 'END'
import { Hero } from 'widgets/home-sections/hero/hero';
import { Categories } from 'widgets/home-sections/categories/categories';
import { ActiveWorks } from 'widgets/home-sections/active-works/active-works';
import { TopFreelancers } from 'widgets/home-sections/top-freelancers/top-freelancers';
import { HowToSolve } from 'widgets/home-sections/how-to-solve/how-to-solve';
import { HelpsBusiness } from 'widgets/home-sections/helps-business/helps-business';

export const HomePage = () => (
  <div className="pageFadeIn">
    <Hero />
    <Categories />
    <ActiveWorks />
    <TopFreelancers />
    <HowToSolve />
    <HelpsBusiness />
  </div>
);
END
echo "export * from './home';" > src/pages/home/index.js

# ================= ENTITY WORK =================
mkdir -p src/entities/work
cat > src/entities/work/work-card.module.css << 'END'
.card {
  background: #fff; border-radius: var(--r); padding: 24px;
  border: 1px solid #F0F0F0; transition: transform var(--t), box-shadow var(--t);
}
.card:hover { transform: translateY(-4px); box-shadow: var(--sh); }
.cardHighlight { border: 2px solid var(--c-primary); }
.head { display: flex; gap: 12px; align-items: center; margin-bottom: 12px; }
.avatar { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }
.author { font-size: 13px; color: var(--c-gray); }
.title { font-size: 16px; font-weight: 700; margin-bottom: 8px; line-height: 1.4; min-height: 44px; }
.desc { font-size: 13px; color: var(--c-gray); line-height: 1.6; margin-bottom: 20px; min-height: 60px; }
.btn {
  width: 100%; padding: 10px;
  border: 1.5px solid var(--c-primary); color: var(--c-primary);
  border-radius: var(--r-sm); font-weight: 600; font-size: 13px;
  background: #fff; cursor: pointer; transition: all var(--t);
}
.btn:hover { background: var(--c-primary); color: #fff; }
END

cat > src/entities/work/work-card.jsx << 'END'
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
END
echo "export * from './work-card';" > src/entities/work/index.js

# ================= ENTITY FREELANCER =================
mkdir -p src/entities/freelancer
cat > src/entities/freelancer/freelancer-card.module.css << 'END'
.card {
  background: #fff; border-radius: var(--r); padding: 20px;
  border: 1px solid #F0F0F0; transition: transform var(--t), box-shadow var(--t);
}
.card:hover { transform: translateY(-4px); box-shadow: var(--sh); }
.head { display: flex; gap: 16px; align-items: center; margin-bottom: 16px; }
.avatar { width: 64px; height: 64px; border-radius: 50%; object-fit: cover; }
.name { font-weight: 700; font-size: 15px; margin-bottom: 2px; }
.role { font-size: 13px; color: var(--c-peach); font-weight: 600; margin-bottom: 2px; }
.projects { font-size: 12px; color: var(--c-gray); }
.stars { display: flex; gap: 2px; margin-bottom: 16px; }
.btn {
  width: 100%; padding: 10px; background: var(--c-primary); color: #fff;
  border-radius: var(--r-sm); font-weight: 600; font-size: 13px;
  border: none; cursor: pointer; transition: background var(--t);
}
.btn:hover { background: var(--c-primary-d); }
END

cat > src/entities/freelancer/freelancer-card.jsx << 'END'
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
END
echo "export * from './freelancer-card';" > src/entities/freelancer/index.js

echo ""
echo "=========================================="
echo "ЧАСТЬ 1 ГОТОВА"
echo "=========================================="
echo ""
echo "Проверь:"
find src -type d -empty
echo ""
echo "Запускай: npm run dev"
