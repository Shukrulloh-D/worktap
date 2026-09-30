#!/bin/bash

echo "[1] AuthContext — user = null"
cat > src/shared/lib/auth/auth-context.jsx << 'ENDX'
import { createContext, useContext, useState } from 'react';

// По умолчанию НЕ залогинен. Войти через кнопку "Войти" в шапке.
// Любой email + пароль от 4 символов = вход.
const Ctx = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);

  const login = (email) => setUser({
    name: 'Ернар Ибрагимов',
    role: 'Дизайнер',
    email: email || 'ernar@worktap.kz',
    avatar: 'https://i.pravatar.cc/100?img=12',
    balance: 250000,
  });

  const logout = () => setUser(null);

  return <Ctx.Provider value={{ user, login, logout }}>{children}</Ctx.Provider>;
};

export const useAuth = () => useContext(Ctx);
ENDX

echo "[2] Header — рабочее меню"
cat > src/widgets/header/header.jsx << 'ENDX'
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
ENDX

echo "[3] AuthModal — теперь логин работает"
cat > src/widgets/auth-modals/auth-modals.jsx << 'ENDX'
import { useState } from 'react';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import { Modal } from 'shared/ui/modal';

export const AuthModals = ({ isOpen, mode, onClose, onSwitch }) => {
  const { login } = useAuth();
  const toast = useToast();
  const [email, setEmail] = useState('');
  const [pwd, setPwd] = useState('');

  const submit = (e) => {
    e.preventDefault();
    if (!email.includes('@')) { toast('Введите корректный email'); return; }
    if (pwd.length < 4) { toast('Пароль минимум 4 символа'); return; }
    login(email);
    toast('Вы вошли в аккаунт');
    onClose();
  };

  if (!isOpen) return null;
  const isLogin = mode === 'login';

  return (
    <Modal isOpen={isOpen} onClose={onClose} maxWidth={460}>
      <h2 style={{ fontSize: 24, fontWeight: 800, marginBottom: 8, textAlign: 'center' }}>
        {isLogin ? 'Вход' : 'Регистрация'}
      </h2>
      <p style={{ fontSize: 13, color: '#8B8B8B', textAlign: 'center', marginBottom: 24 }}>
        {isLogin ? 'Войдите в свой аккаунт' : 'Создайте новый аккаунт'}
      </p>
      <form onSubmit={submit} style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
        {!isLogin && <input className="input" placeholder="ФИО" />}
        <input className="input" placeholder="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        <input className="input" placeholder="Пароль" type="password" value={pwd} onChange={(e) => setPwd(e.target.value)} />
        <button type="submit" className="btn btn-primary btn-full" style={{ padding: 14 }}>
          {isLogin ? 'Войти' : 'Зарегистрироваться'}
        </button>
      </form>
      <div style={{ textAlign: 'center', marginTop: 16, fontSize: 13, color: '#8B8B8B' }}>
        {isLogin ? 'Нет аккаунта? ' : 'Уже есть аккаунт? '}
        <button onClick={() => onSwitch(isLogin ? 'signup' : 'login')} style={{ color: '#21B349', fontWeight: 700, background: 'none', border: 'none', cursor: 'pointer' }}>
          {isLogin ? 'Регистрация' : 'Войти'}
        </button>
      </div>
    </Modal>
  );
};
ENDX

echo "[4] Images config — все пути в одном файле"
cat > src/shared/config/images.js << 'ENDX'
// ============================================================
// ВСЕ КАРТИНКИ ПРОЕКТА — меняешь пути здесь и всё обновляется
// ============================================================
//
// КАК ЗАМЕНИТЬ:
// 1. Положи свою картинку в public/images/имя.png
// 2. Открой этот файл
// 3. Замени значение на '/images/имя.png'
//
// Пример:
//   heroImage: 'https://i.pravatar.cc/300?img=12'
//   → heroImage: '/images/hero.png'
// ============================================================

export const IMAGES = {
  // === ЛОГОТИП ===
  logo: '/logo.svg',                     // public/logo.svg

  // === ГЛАВНАЯ — HERO ===
  heroAvatar: 'https://i.pravatar.cc/300?img=12',   // человек на главной

  // === ГЛАВНАЯ — БЛОК "КАК WORKTAP ПОМОГАЕТ БИЗНЕСУ" ===
  helpsBusiness: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600',

  // === ПРОФИЛЬ (юзер) ===
  userAvatar: 'https://i.pravatar.cc/100?img=12',

  // === КАРТИНКИ ТОВАРОВ (ворки, заказы) ===
  // Используются через `work.img` в mocks.js
  workPlaceholder: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400',

  // === АВАТАРЫ ФРИЛАНСЕРОВ (для карточек) ===
  // Используются в mocks.js FREELANCERS
  freelancerAvatar: (n) => `https://i.pravatar.cc/80?img=${n}`,

  // === AVATAR для отзывов и чата ===
  reviewAvatar: 'https://i.pravatar.cc/60?img=12',
  chatAvatar: 'https://i.pravatar.cc/60?img=12',
};

// Короткие помощники для картинок в моках
export const img = (seed, w = 400) =>
  `https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=${w}&sig=${seed}`;

export const avatar = (n) => `https://i.pravatar.cc/80?img=${n}`;
ENDX

echo "export * from './images';" > src/shared/config/index.js

echo "[5] Home Hero — ссылки на картинки в удобном виде"
cat > src/widgets/home-sections/hero/hero.jsx << 'ENDX'
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';

export const Hero = () => {
  const nav = useNavigate();
  return (
    <section style={{ background: 'linear-gradient(135deg, #FFF5EB 0%, #FFF 60%)', padding: '60px 0 100px' }}>
      <div className="container" style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 60, alignItems: 'center' }}>
        <div>
          <h1 style={{ fontSize: 44, fontWeight: 800, lineHeight: 1.15, marginBottom: 16, letterSpacing: -1 }}>
            Ищите и находите подходящую работу среди <span style={{ color: '#21B349' }}>10,000+</span> проектов и покажите на что Вы способны!
          </h1>
          <div style={{ display: 'flex', gap: 8, marginBottom: 20, maxWidth: 520 }}>
            <input className="input" placeholder="Какую работу ищете?" style={{ flex: 1 }} />
            <button className="btn btn-peach" style={{ padding: '12px 32px' }}>Найти</button>
          </div>
          <div style={{ display: 'flex', gap: 12, flexWrap: 'wrap', fontSize: 13 }}>
            {['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'].map(c => (
              <button key={c} onClick={() => nav(`/exchange?cat=${c}`)} style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#8B8B8B', fontSize: 13 }}>{c}</button>
            ))}
            <button onClick={() => nav('/exchange')} style={{ padding: '4px 12px', border: '1px solid #FBA457', borderRadius: 20, color: '#FBA457', background: 'none', cursor: 'pointer', fontSize: 12, fontWeight: 600 }}>Все категории</button>
          </div>
        </div>

        {/* ЗАМЕНИ КАРТИНКУ ТУТ */}
        <div style={{ position: 'relative', textAlign: 'center' }}>
          <div style={{ width: 380, height: 380, borderRadius: '50%', background: '#FFE4CC', margin: '0 auto', display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative' }}>
            <img
              src={IMAGES.heroAvatar}
              alt=""
              style={{ width: 260, height: 260, borderRadius: '50%', objectFit: 'cover' }}
            />
            <div style={{ position: 'absolute', bottom: 60, right: -10, background: 'white', padding: '8px 16px', borderRadius: 12, boxShadow: '0 10px 30px rgba(0,0,0,0.1)', display: 'flex', gap: 4 }}>
              {[1,2,3,4,5].map(i => <span key={i} style={{ color: '#FFB800', fontSize: 18 }}>★</span>)}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
ENDX

echo "[6] HelpsBusiness — ссылка на картинку"
cat > src/widgets/home-sections/helps-business/helps-business.jsx << 'ENDX'
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';

export const HelpsBusiness = () => {
  const nav = useNavigate();
  return (
    <section style={{ background: '#FFC700', padding: '80px 0' }}>
      <div className="container" style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 60, alignItems: 'center' }}>
        <div>
          <h2 style={{ fontSize: 32, fontWeight: 800, marginBottom: 24 }}>Как WorkTap помогает бизнесу?</h2>
          {[{ i: '💳', t: 'Оплачивайте с р/с или карты компании' }, { i: '💰', t: 'Экономьте до 87% бюджета на фрилансе' }, { i: '⏱', t: 'Экономьте до 75% времени на решении фриланс задач' }].map((b, i) => (
            <div key={i} style={{ background: 'white', padding: 20, borderRadius: 12, marginBottom: 16, display: 'flex', gap: 16, alignItems: 'center' }}>
              <span style={{ fontSize: 28 }}>{b.i}</span>
              <span style={{ fontSize: 14, fontWeight: 500 }}>{b.t}</span>
            </div>
          ))}
          <h3 style={{ fontSize: 20, fontWeight: 800, marginTop: 32, marginBottom: 20 }}>WorkTap — быстро, просто и безопасно!</h3>
          <button onClick={() => nav('/exchange')} className="btn" style={{ background: '#7C6FE0', color: 'white', padding: '14px 40px' }}>Начать!</button>
        </div>
        <div style={{ textAlign: 'center' }}>
          {/* ЗАМЕНИ КАРТИНКУ ТУТ */}
          <img src={IMAGES.helpsBusiness} alt="" style={{ width: '100%', maxWidth: 500, borderRadius: 20, boxShadow: '0 30px 80px rgba(0,0,0,0.3)' }} />
        </div>
      </div>
    </section>
  );
};
ENDX

echo "[7] Mocks — картинки через хелпер"
cat > src/shared/api/mocks.js << 'ENDX'
import { img, avatar } from 'shared/config/images';

export const CATEGORIES = [
  { id: 'texts', name: 'Тексты и переводы', icon: '📝' },
  { id: 'dev', name: 'Разработка', icon: '💻' },
  { id: 'design', name: 'Дизайн', icon: '🎨' },
  { id: 'audio', name: 'Аудио, видео монтаж', icon: '🎬' },
  { id: 'seo', name: 'SEO и оптимизация', icon: '📈' },
  { id: 'business', name: 'Бизнес и жизнь', icon: '💼' },
  { id: 'smm', name: 'Соцсети и реклама', icon: '📱' },
];

export const ACTIVE_WORKS = [
  { id: 1, title: 'Сделать дизайн интернет-магазина', author: 'Никита Евреев', avatar: avatar(12), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam, enim.' },
  { id: 2, title: 'Верстка landing page', author: 'Семён Сергеев', avatar: avatar(33), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
  { id: 3, title: 'Сделать дизайн сайта-каталога', author: 'Ангелина Сорокина', avatar: avatar(45), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
  { id: 4, title: 'Продвижение instagram', author: 'Марина Королёва', avatar: avatar(25), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
  { id: 5, title: 'Срочно! Нужен веб дизайнер!', author: 'Никита Евреев', avatar: avatar(12), desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed leo at hendrerit dictum diam.' },
];

export const FREELANCERS = [
  { id: 1, name: 'Марина Королёва', role: 'Разработчик PHP', projects: 65, rating: 4, avatar: avatar(25) },
  { id: 2, name: 'Семён Сергеев', role: 'Копирайтер', projects: 104, rating: 5, avatar: avatar(33) },
  { id: 3, name: 'Ангелина Сорокина', role: 'Дизайнер сайтов', projects: 25, rating: 5, avatar: avatar(45) },
  { id: 4, name: 'Никита Зайцев', role: 'Маркетолог', projects: 144, rating: 4, avatar: avatar(12) },
  { id: 5, name: 'Наталья Захарова', role: 'Motion дизайнер', projects: 71, rating: 5, avatar: avatar(32) },
];

export const EXCHANGE_JOBS = Array(8).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Нужно сделать Дизайн сайта по тематике авто',
  author: 'Екатерина Иванова',
  avatar: avatar(20),
  postedProjects: 25,
  reviews: 15,
  rating: 4,
  budget: 50000,
  time: '4 часа 28 минут назад',
  offers: 50,
}));

export const PURCHASES = Array(12).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Дизайн сайта',
  package: 'Стандарт пакет',
  price: 50000,
  date: '26.03.2021',
  status: i % 3 === 0 ? 'Завершено' : 'Выполняется',
  image: img(i + 1),
}));

export const MY_ORDERS = Array(6).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Нужно сделать Дизайн сайта по тематике авто',
  desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mus volutpat sollicitudin in ligula.',
  budget: 50000,
  time: '4 часа 28 минут назад',
  offers: 50,
  status: i % 4 === 0 ? 'Прием ставок' : i % 4 === 1 ? 'Завершено' : i % 4 === 2 ? 'Закрыт' : 'Завершено',
}));

export const REVIEWS = Array(6).fill(null).map((_, i) => ({
  id: i + 1,
  author: 'Никита Евреев',
  rating: 4,
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus tincidunt eget eu, eget commodo condimentum non.',
}));

export const WALLET_HISTORY = [
  { id: 1, type: 'in', operation: 'Пополнение баланса', date: '22 октября, 2021 года', amount: 150000, hash: 'c2d5abb5bd5d8e9b5d0379b8ef8f70ce9df5a97daf68' },
  { id: 2, type: 'out', operation: 'Вывод средств', date: '15 октября, 2021 года', amount: 300000, hash: '826ad6c3e5757f747304a0cc7a4f4e000f6ffacd832' },
  { id: 3, type: 'buy', operation: 'Покупка услуги', date: '14 сентября, 2021 года', amount: 200000, hash: '987829a3bdfb28cbb8b69d4a4dcdeedce6f3792ac' },
];

export const FAVORITES = Array(12).fill(null).map((_, i) => ({
  id: i + 1,
  title: 'Дизайн сайта',
  price: 50000,
  author: 'Екатерина Иванова',
  avatar: avatar(20),
  projects: 45,
  rating: 4,
  image: img(i + 100),
}));
ENDX

echo "[8] Purchases/Favorites — картинки из мока"
cat > src/pages/purchases/purchases.jsx << 'ENDX'
import { PURCHASES } from 'shared/api/mocks';
import { useToast } from 'shared/lib/toast';
export const PurchasesPage = () => {
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>История <span style={{ color: '#FBA457' }}>покупок</span></h1>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            {PURCHASES.map(p => (
              <div key={p.id} className="hoverLift" style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0' }}>
                {/* КАРТИНКА ТОВАРА — меняется через p.image в mocks.js */}
                <img src={p.image} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
                <div style={{ padding: 16 }}>
                  <h3 style={{ fontSize: 15, fontWeight: 700, marginBottom: 4 }}>{p.title}</h3>
                  <div style={{ fontSize: 12, color: '#8B8B8B', marginBottom: 8 }}>{p.package}</div>
                  <div style={{ fontSize: 15, fontWeight: 700, color: '#21B349', marginBottom: 4 }}>{p.price.toLocaleString()} тенге</div>
                  <div style={{ fontSize: 12, color: '#8B8B8B', marginBottom: 12 }}>{p.date}</div>
                  <div style={{ fontSize: 13, fontWeight: 600, color: p.status === 'Завершено' ? '#21B349' : '#FBA457', marginBottom: 16 }}>{p.status}</div>
                  <div style={{ display: 'flex', gap: 8 }}>
                    <button onClick={() => toast('В чат')} className="btn btn-outline btn-sm" style={{ flex: 1 }}>В чат</button>
                    <button onClick={() => toast('Подробнее')} className="btn btn-primary btn-sm" style={{ flex: 1 }}>Подробнее</button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
ENDX

cat > src/pages/favorites/favorites.jsx << 'ENDX'
import { useNavigate } from 'react-router-dom';
import { FAVORITES } from 'shared/api/mocks';
import { StarIcon } from 'shared/ui/icon';
export const FavoritesPage = () => {
  const nav = useNavigate();
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>Избранные <span style={{ color: '#FBA457' }}>ворки</span></h1>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            {FAVORITES.map(f => (
              <div key={f.id} onClick={() => nav('/exchange')} className="hoverLift" style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0', cursor: 'pointer' }}>
                {/* КАРТИНКА — меняется через f.image в mocks.js */}
                <img src={f.image} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
                <div style={{ padding: 16 }}>
                  <h3 style={{ fontSize: 15, fontWeight: 700, marginBottom: 6 }}>{f.title}</h3>
                  <div style={{ color: '#21B349', fontWeight: 700, fontSize: 15, marginBottom: 12 }}>{f.price.toLocaleString()} тенге</div>
                  <div style={{ display: 'flex', gap: 8, alignItems: 'center', marginBottom: 8 }}>
                    <img src={f.avatar} alt="" style={{ width: 32, height: 32, borderRadius: '50%' }} />
                    <div style={{ fontSize: 12 }}>
                      <div style={{ fontWeight: 600 }}>{f.author}</div>
                      <div style={{ color: '#8B8B8B' }}>Проектов: {f.projects}</div>
                    </div>
                  </div>
                  <div style={{ display: 'flex', gap: 2 }}>
                    {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= f.rating} size={14} />)}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
ENDX

echo ""
echo "==============================================="
echo "ГОТОВО"
echo "==============================================="
echo ""
echo "Запусти: npm run dev"
echo ""
