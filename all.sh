#!/bin/bash

mkdir -p src/entities/work
mkdir -p src/entities/freelancer
mkdir -p src/entities/review
mkdir -p src/widgets/header
mkdir -p src/widgets/footer
mkdir -p src/widgets/auth-modals
mkdir -p src/widgets/info-modals
mkdir -p src/widgets/home-sections/hero
mkdir -p src/widgets/home-sections/categories
mkdir -p src/widgets/home-sections/active-works
mkdir -p src/widgets/home-sections/top-freelancers
mkdir -p src/widgets/home-sections/how-to-solve
mkdir -p src/widgets/home-sections/helps-business
mkdir -p src/pages/home
mkdir -p src/pages/exchange
mkdir -p src/pages/works
mkdir -p src/pages/contests
mkdir -p src/pages/create-work
mkdir -p src/pages/create-order
mkdir -p src/pages/profile
mkdir -p src/pages/chat
mkdir -p src/pages/wallet
mkdir -p src/pages/purchases
mkdir -p src/pages/my-orders
mkdir -p src/pages/favorites
mkdir -p src/pages/not-found
mkdir -p src/app/layouts
mkdir -p src/app/router
mkdir -p src/app/styles
mkdir -p src/shared/lib/auth
mkdir -p src/shared/lib/toast
mkdir -p src/shared/lib/hooks

# =========== ENTITIES ===========
cat > src/entities/work/work-card.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
export const WorkCard = ({ work, variant, onOrder }) => {
  const nav = useNavigate();
  const isHL = variant === 'highlight';
  return (
    <div className="hoverLift" style={{ background: 'white', borderRadius: 12, padding: 24, border: isHL ? '2px solid #21B349' : '1px solid #F0F0F0' }}>
      <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 12 }}>
        <img src={work.avatar} alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
        <div style={{ fontSize: 13, color: '#8B8B8B' }}>{work.author}</div>
      </div>
      <div style={{ fontSize: 16, fontWeight: 700, marginBottom: 8, minHeight: 44, lineHeight: 1.4 }}>{work.title}</div>
      <p style={{ fontSize: 13, color: '#8B8B8B', lineHeight: 1.6, marginBottom: 20, minHeight: 60 }}>{work.desc}</p>
      <button onClick={onOrder} style={{ width: '100%', padding: 10, border: '1.5px solid #21B349', color: '#21B349', borderRadius: 8, fontWeight: 600, fontSize: 13, background: 'white', cursor: 'pointer' }}>Посмотреть</button>
    </div>
  );
};
XEOFX
echo "export * from './work-card';" > src/entities/work/index.js

cat > src/entities/freelancer/freelancer-card.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
import { StarIcon } from 'shared/ui/icon';
export const FreelancerCard = ({ freelancer }) => {
  const nav = useNavigate();
  return (
    <div className="hoverLift" style={{ background: 'white', borderRadius: 12, padding: 20, border: '1px solid #F0F0F0' }}>
      <div style={{ display: 'flex', gap: 16, alignItems: 'center', marginBottom: 16 }}>
        <img src={freelancer.avatar} alt="" style={{ width: 64, height: 64, borderRadius: '50%' }} />
        <div>
          <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 2 }}>{freelancer.name}</div>
          <div style={{ fontSize: 13, color: '#FBA457', fontWeight: 600, marginBottom: 2 }}>{freelancer.role}</div>
          <div style={{ fontSize: 12, color: '#8B8B8B' }}>Выполнено проектов: {freelancer.projects}</div>
        </div>
      </div>
      <div style={{ display: 'flex', gap: 2, marginBottom: 16 }}>
        {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= freelancer.rating} size={16} />)}
      </div>
      <button onClick={() => nav('/chat')} style={{ width: '100%', padding: 10, background: '#21B349', color: 'white', borderRadius: 8, fontWeight: 600, fontSize: 13, border: 'none', cursor: 'pointer' }}>Написать</button>
    </div>
  );
};
XEOFX
echo "export * from './freelancer-card';" > src/entities/freelancer/index.js

cat > src/entities/review/review-card.jsx << 'XEOFX'
import { StarIcon } from 'shared/ui/icon';
export const ReviewCard = ({ review }) => (
  <div style={{ background: 'white', borderRadius: 12, padding: 20, border: '1px solid #F0F0F0' }}>
    <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 12 }}>
      <div style={{ width: 40, height: 40, borderRadius: '50%', background: '#E5E5E5' }} />
      <div style={{ fontWeight: 700, fontSize: 14 }}>{review.author}</div>
    </div>
    <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
      {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= review.rating} size={14} />)}
    </div>
    <p style={{ fontSize: 13, color: '#8B8B8B', lineHeight: 1.6 }}>{review.text}</p>
  </div>
);
XEOFX
echo "export * from './review-card';" > src/entities/review/index.js

echo "[1/6] entities done"

# =========== HEADER ===========
cat > src/widgets/header/header.jsx << 'XEOFX'
import { Link, NavLink, useNavigate } from 'react-router-dom';
import { useState } from 'react';
import { useAuth } from 'shared/lib/auth';
import { BellIcon, ChatIcon, ChevronDown } from 'shared/ui/icon';

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

  return (
    <header style={{ background: 'white', borderBottom: '1px solid #F0F0F0', position: 'sticky', top: 0, zIndex: 100 }}>
      <div style={{ maxWidth: 1230, margin: '0 auto', padding: '0 20px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', height: 80 }}>
        <Link to="/" style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
          <img src="/logo.svg" alt="WorkTap" style={{ height: 36 }} />
          <span style={{ fontSize: 20, fontWeight: 800 }}>worktap</span>
        </Link>

        <nav style={{ display: 'flex', gap: 28, fontSize: 14, fontWeight: 500 }}>
          {NAV.map(i => (
            <NavLink key={i.to} to={i.to} style={({ isActive }) => ({ color: isActive ? '#21B349' : '#1F1F1F' })}>
              {i.label}
            </NavLink>
          ))}
        </nav>

        {user ? (
          <div style={{ display: 'flex', gap: 16, alignItems: 'center' }}>
            <button onClick={() => nav('/works')} style={{ color: '#B8B8B8', background: 'none', border: 'none', cursor: 'pointer' }}><BellIcon /></button>
            <button onClick={() => nav('/chat')} style={{ color: '#B8B8B8', background: 'none', border: 'none', cursor: 'pointer' }}><ChatIcon /></button>
            <div style={{ position: 'relative' }} onMouseLeave={() => setMenu(false)}>
              <div style={{ display: 'flex', gap: 8, alignItems: 'center', cursor: 'pointer' }} onClick={() => setMenu(!menu)}>
                <span style={{ fontSize: 14, fontWeight: 600 }}>{user.name}</span>
                <img src={user.avatar} alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
                <ChevronDown />
              </div>
              {menu && (
                <div style={{ position: 'absolute', top: 56, right: 0, background: 'white', boxShadow: '0 10px 40px rgba(0,0,0,0.1)', borderRadius: 12, padding: 8, minWidth: 220, zIndex: 200 }}>
                  <div style={{ padding: '8px 12px', fontSize: 12, color: '#8B8B8B' }}>Личный кабинет</div>
                  <Link to="/profile" style={{ display: 'block', padding: '10px 12px', fontSize: 14 }}>Мой профиль</Link>
                  <Link to="/my-orders" style={{ display: 'block', padding: '10px 12px', fontSize: 14 }}>Мои заказы</Link>
                  <Link to="/purchases" style={{ display: 'block', padding: '10px 12px', fontSize: 14 }}>История покупок</Link>
                  <Link to="/favorites" style={{ display: 'block', padding: '10px 12px', fontSize: 14 }}>Избранные ворки</Link>
                  <Link to="/wallet" style={{ display: 'block', padding: '10px 12px', fontSize: 14 }}>Мой кошелек</Link>
                  <div style={{ borderTop: '1px solid #F0F0F0', margin: '6px 0' }} />
                  <button onClick={() => { setMenu(false); logout(); }} style={{ display: 'block', padding: '10px 12px', fontSize: 14, color: '#F04438', width: '100%', textAlign: 'left', background: 'none', border: 'none', cursor: 'pointer' }}>Выйти из аккаунта</button>
                </div>
              )}
            </div>
          </div>
        ) : (
          <div style={{ display: 'flex', gap: 12, alignItems: 'center' }}>
            <button onClick={() => onOpenAuth('login')} style={{ fontSize: 14, fontWeight: 600, background: 'none', border: 'none', cursor: 'pointer' }}>Регистрация</button>
            <button onClick={() => onOpenAuth('login')} className="btn btn-primary" style={{ padding: '10px 24px' }}>Войти</button>
          </div>
        )}
      </div>
    </header>
  );
};
XEOFX
echo "export * from './header';" > src/widgets/header/index.js

echo "[2/6] header done"

# =========== FOOTER ===========
cat > src/widgets/footer/footer.jsx << 'XEOFX'
export const Footer = () => (
  <footer style={{ background: '#F5F5F7', paddingTop: 60, marginTop: 80 }}>
    <div style={{ maxWidth: 1230, margin: '0 auto', padding: '0 20px', display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 40 }}>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Топ категории</h4>
        {['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','Соцсети и реклама','Бизнес и жизнь','SEO и оптимизация'].map(c => <a key={c} href="/exchange" style={{ display: 'block', fontSize: 13, color: '#8B8B8B', padding: '6px 0' }}>{c}</a>)}
      </div>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>О Проекте</h4>
        {['О Нас','Как Это Работает','Политика Приватности','Правила Пользования','Пресса о нас'].map(c => <a key={c} href="/" style={{ display: 'block', fontSize: 13, color: '#8B8B8B', padding: '6px 0' }}>{c}</a>)}
      </div>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Поддержка</h4>
        {['Контакты','Политика Безопасности','FAQ'].map(c => <a key={c} href="/" style={{ display: 'block', fontSize: 13, color: '#8B8B8B', padding: '6px 0' }}>{c}</a>)}
      </div>
      <div>
        <h4 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Follow</h4>
        <div style={{ display: 'flex', gap: 12, marginTop: 12 }}>
          {['f','t','i','in'].map((s, i) => <a key={i} href="/" style={{ width: 40, height: 40, borderRadius: '50%', background: i === 1 ? '#21B349' : '#1F1F1F', display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'white', fontSize: 16, fontWeight: 700 }}>{s}</a>)}
        </div>
      </div>
    </div>
    <div style={{ maxWidth: 1230, margin: '40px auto 0', padding: '24px 20px', borderTop: '1px solid #E5E5E5', textAlign: 'center', fontSize: 13, color: '#8B8B8B' }}>
      Copyright @ 2021 | WorkTap - Worktap.KZ. All Rights Reserved
    </div>
  </footer>
);
XEOFX
echo "export * from './footer';" > src/widgets/footer/index.js

# =========== AUTH MODAL ===========
cat > src/widgets/auth-modals/auth-modals.jsx << 'XEOFX'
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
    if (pwd.length < 4) { toast('Пароль слишком короткий'); return; }
    login();
    toast('Вы вошли в аккаунт');
    onClose();
  };

  if (!isOpen) return null;
  const isLogin = mode === 'login';

  return (
    <Modal isOpen={isOpen} onClose={onClose} maxWidth={480}>
      <h2 style={{ fontSize: 24, fontWeight: 800, marginBottom: 8, textAlign: 'center' }}>{isLogin ? 'Вход' : 'Регистрация'}</h2>
      <p style={{ fontSize: 13, color: '#8B8B8B', textAlign: 'center', marginBottom: 24 }}>{isLogin ? 'Войдите в свой аккаунт' : 'Создайте новый аккаунт'}</p>
      <form onSubmit={submit} style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
        {!isLogin && <input className="input" placeholder="ФИО" />}
        <input className="input" placeholder="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        <input className="input" placeholder="Пароль" type="password" value={pwd} onChange={(e) => setPwd(e.target.value)} />
        <button type="submit" className="btn btn-primary btn-full" style={{ padding: 14 }}>{isLogin ? 'Войти' : 'Зарегистрироваться'}</button>
      </form>
      <div style={{ textAlign: 'center', marginTop: 16, fontSize: 13, color: '#8B8B8B' }}>
        {isLogin ? 'Нет аккаунта? ' : 'Уже есть аккаунт? '}
        <button onClick={() => onSwitch(isLogin ? 'signup' : 'login')} style={{ color: '#21B349', fontWeight: 700, background: 'none', border: 'none', cursor: 'pointer' }}>{isLogin ? 'Регистрация' : 'Войти'}</button>
      </div>
    </Modal>
  );
};
XEOFX
echo "export * from './auth-modals';" > src/widgets/auth-modals/index.js

# =========== INFO MODALS ===========
cat > src/widgets/info-modals/info-modals.jsx << 'XEOFX'
import { Modal } from 'shared/ui/modal';

const CONTENT = {
  about: { title: 'О нас', body: <p style={{ fontSize: 14, lineHeight: 1.7, color: '#4B4B4B' }}>WorkTap - онлайн сервис поиска частных специалистов для решения бизнес задач в кратчайшие сроки. Наша платформа объединяет заказчиков услуг, которым необходимо выполнить какую-либо работу, и компетентных специалистов.</p> },
  how: { title: 'Как это работает', body: (
    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
      {[{ i: 1, t: 'Укажите вид работы и категорию' }, { i: 2, t: 'Выберите специалиста', d: 'Каждый специалист перед началом работы проходит тщательную проверку, имеет рейтинг и отзывы.' }, { i: 3, t: 'Оплатите услугу' }, { i: 4, t: 'Специалист выполняет работу', d: 'После выполнения заказа у вас будет возможность поставить оценку и написать отзыв.' }].map((s, k) => (
        <div key={k}>
          <div style={{ width: 40, height: 40, borderRadius: '50%', background: '#E8F7EC', color: '#21B349', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 700, marginBottom: 12 }}>{s.i}</div>
          <div style={{ fontWeight: 700, fontSize: 14, marginBottom: 8 }}>{s.t}</div>
          {s.d && <div style={{ fontSize: 12, color: '#8B8B8B', lineHeight: 1.5 }}>{s.d}</div>}
        </div>
      ))}
    </div>
  )},
  rules: { title: 'Правила сервиса', body: <div style={{ fontSize: 13, lineHeight: 1.7, color: '#4B4B4B' }}><p style={{ marginBottom: 12 }}>1. Пользоваться сервисом worktap.kz может любой человек, достигший совершеннолетия.</p><p style={{ marginBottom: 12 }}>2. У одного человека может быть только один аккаунт.</p><p>3. При регистрации пользователь самостоятельно выбирает логин.</p></div> },
  privacy: { title: 'Политика безопасности', body: <div style={{ fontSize: 13, lineHeight: 1.7, color: '#4B4B4B' }}><p style={{ marginBottom: 12 }}><b>Платежи.</b> Оплата банковской картой онлайн. Наш сайт подключен к интернет-эквайрингу.</p><p><b>CVC2/CVV2.</b> это трёхзначный код безопасности, находящийся на оборотной стороне карты.</p></div> },
};

export const InfoModals = ({ type, onClose }) => {
  if (!type || !CONTENT[type]) return null;
  const c = CONTENT[type];
  return (
    <Modal isOpen onClose={onClose} maxWidth={type === 'privacy' ? 900 : 720}>
      <h2 style={{ fontSize: 28, fontWeight: 800, marginBottom: 24, textAlign: 'center' }}>{c.title}</h2>
      {c.body}
      <div style={{ textAlign: 'center', marginTop: 32 }}>
        <button onClick={onClose} className="btn btn-primary" style={{ padding: '12px 60px', borderRadius: 40 }}>Понятно</button>
      </div>
    </Modal>
  );
};
XEOFX
echo "export * from './info-modals';" > src/widgets/info-modals/index.js

echo "[3/6] widgets core done"

# =========== HOME SECTIONS ===========
cat > src/widgets/home-sections/hero/hero.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
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
        <div style={{ position: 'relative', textAlign: 'center' }}>
          <div style={{ width: 380, height: 380, borderRadius: '50%', background: '#FFE4CC', margin: '0 auto', display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative' }}>
            <img src="https://i.pravatar.cc/300?img=12" alt="" style={{ width: 260, height: 260, borderRadius: '50%', objectFit: 'cover' }} />
            <div style={{ position: 'absolute', bottom: 60, right: -10, background: 'white', padding: '8px 16px', borderRadius: 12, boxShadow: '0 10px 30px rgba(0,0,0,0.1)', display: 'flex', gap: 4 }}>
              {[1,2,3,4,5].map(i => <span key={i} style={{ color: '#FFB800', fontSize: 18 }}>★</span>)}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
XEOFX

cat > src/widgets/home-sections/categories/categories.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
import { CATEGORIES } from 'shared/api/mocks';
export const Categories = () => {
  const nav = useNavigate();
  return (
    <section style={{ padding: '60px 0' }}>
      <div className="container">
        <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Выберите рубрику, чтобы начать</h3>
        <div style={{ display: 'flex', gap: 12, flexWrap: 'wrap' }}>
          {CATEGORIES.map(c => (
            <button key={c.id} onClick={() => nav(`/exchange?cat=${c.name}`)} style={{ padding: '8px 16px', border: '1px solid #E5E5E5', borderRadius: 8, background: 'white', fontSize: 13, cursor: 'pointer' }}>{c.name}</button>
          ))}
          <button onClick={() => nav('/exchange')} style={{ padding: '8px 16px', border: '1px solid #FBA457', borderRadius: 8, color: '#FBA457', background: 'white', fontSize: 13, fontWeight: 600, cursor: 'pointer' }}>Все категории</button>
        </div>
      </div>
    </section>
  );
};
XEOFX

cat > src/widgets/home-sections/active-works/active-works.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
export const ActiveWorks = () => {
  const nav = useNavigate();
  return (
    <section style={{ padding: '40px 0' }}>
      <div className="container">
        <h2 className="section-title">Актуальные ворки</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 24 }}>
          {ACTIVE_WORKS.map((w, i) => <WorkCard key={w.id} work={w} variant={i === 1 ? 'highlight' : 'default'} onOrder={() => nav('/exchange')} />)}
          <div onClick={() => nav('/works')} className="hoverLift" style={{ background: '#F5F0FF', borderRadius: 12, display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', minHeight: 260, fontWeight: 700, fontSize: 16, color: '#7C6FE0' }}>Смотреть все ворки</div>
        </div>
      </div>
    </section>
  );
};
XEOFX

cat > src/widgets/home-sections/top-freelancers/top-freelancers.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
import { FreelancerCard } from 'entities/freelancer';
import { FREELANCERS } from 'shared/api/mocks';
export const TopFreelancers = () => {
  const nav = useNavigate();
  return (
    <section style={{ padding: '60px 0' }}>
      <div className="container">
        <h2 className="section-title">Топ фрилансеров</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 24 }}>
          {FREELANCERS.map(f => <FreelancerCard key={f.id} freelancer={f} />)}
          <div onClick={() => nav('/exchange')} className="hoverLift" style={{ background: '#F5F0FF', borderRadius: 12, display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', minHeight: 230, fontWeight: 700, fontSize: 15, color: '#7C6FE0', padding: 20, textAlign: 'center' }}>Посмотреть всех ТОП фрилансеров</div>
        </div>
      </div>
    </section>
  );
};
XEOFX

cat > src/widgets/home-sections/how-to-solve/how-to-solve.jsx << 'XEOFX'
export const HowToSolve = () => (
  <section style={{ padding: '60px 0', background: '#FAFAFA' }}>
    <div className="container">
      <h2 className="section-title">Как решать задачи на WorkTap?</h2>
      <a href="/" style={{ color: '#21B349', fontSize: 14, fontWeight: 600, display: 'inline-block', marginBottom: 32 }}>Идеально подходит для бизнеса и частных лиц</a>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 40 }}>
        {[{ t: 'Выберите услугу', d: 'В супермаркете WorkTap представлен широкий выбор услуг от квалифицированных специалистов.' }, { t: 'Оплатите', d: 'Деньги будут перечислены продавцу после того, как он выполнит работу, и вы её одобрите.' }, { t: 'Получите результат', d: 'Наш супермаркет гарантирует вам возврат средств в полном объёме в случае невыполнения заказа.' }].map((s, i) => (
          <div key={i}>
            <div style={{ fontSize: 48, marginBottom: 16 }}>{['👤','💳','📄'][i]}</div>
            <h3 style={{ fontSize: 18, fontWeight: 700, marginBottom: 12 }}>{s.t}</h3>
            <p style={{ fontSize: 14, color: '#8B8B8B', lineHeight: 1.6 }}>{s.d}</p>
          </div>
        ))}
      </div>
    </div>
  </section>
);
XEOFX

cat > src/widgets/home-sections/helps-business/helps-business.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
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
          <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600" alt="" style={{ width: '100%', maxWidth: 500, borderRadius: 20, boxShadow: '0 30px 80px rgba(0,0,0,0.3)' }} />
        </div>
      </div>
    </section>
  );
};
XEOFX

echo "[4/6] home sections done"

# =========== PAGES ===========
cat > src/pages/home/home.jsx << 'XEOFX'
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
XEOFX
echo "export * from './home';" > src/pages/home/index.js

cat > src/pages/exchange/exchange.jsx << 'XEOFX'
import { useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { EXCHANGE_JOBS } from 'shared/api/mocks';
import { StarIcon } from 'shared/ui/icon';

export const ExchangePage = () => {
  const nav = useNavigate();
  const [params] = useSearchParams();
  const [visible, setVisible] = useState(6);
  const category = params.get('cat');
  const jobs = [...EXCHANGE_JOBS, ...EXCHANGE_JOBS].slice(0, visible);

  return (
    <div className="pageFadeIn">
      <section style={{ background: 'linear-gradient(135deg, #FFF5EB 0%, #FFF 60%)', padding: '60px 0', textAlign: 'center' }}>
        <div className="container">
          <h1 style={{ fontSize: 32, fontWeight: 800, marginBottom: 24, maxWidth: 700, margin: '0 auto 24px' }}>
            Ищите и находите подходящую работу среди <span style={{ color: '#21B349' }}>10,000+</span> проектов
          </h1>
          <div style={{ display: 'flex', gap: 8, maxWidth: 600, margin: '0 auto 24px' }}>
            <input className="input" placeholder="Какую работу ищете?" style={{ flex: 1 }} />
            <button className="btn btn-peach" style={{ padding: '12px 32px' }}>Найти</button>
          </div>
          <div style={{ display: 'flex', gap: 12, justifyContent: 'center', flexWrap: 'wrap' }}>
            {['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'].map(c => (
              <button key={c} onClick={() => nav(`/exchange?cat=${c}`)} style={{ padding: '6px 14px', border: '1px solid #E5E5E5', borderRadius: 20, background: 'white', fontSize: 12, cursor: 'pointer' }}>{c}</button>
            ))}
          </div>
        </div>
      </section>
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h2 style={{ fontSize: 20, fontWeight: 700, marginBottom: 20, textAlign: 'center' }}>Ниже все заказы по {category || 'дизайну'}</h2>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 24, flexWrap: 'wrap', gap: 16 }}>
            <div style={{ fontSize: 14, color: '#8B8B8B' }}>65 проектов по {category || 'дизайну'}</div>
            <div style={{ display: 'flex', gap: 16 }}>
              <input className="input" placeholder="Минимальная цена" style={{ width: 150, padding: '8px 12px' }} />
              <input className="input" placeholder="Максимальная цена" style={{ width: 150, padding: '8px 12px' }} />
              <select className="input" style={{ width: 180, padding: '8px 12px' }}><option>По возрастанию цены</option></select>
            </div>
          </div>
          {jobs.map((j, idx) => (
            <div key={idx} className="hoverLift" style={{ background: 'white', borderRadius: 12, padding: 24, marginBottom: 16, display: 'grid', gridTemplateColumns: '1fr auto', gap: 24, boxShadow: '0 4px 20px rgba(0,0,0,0.03)' }}>
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>{j.title}</h3>
                <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 8 }}>
                  <img src={j.avatar} alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
                  <div>
                    <div style={{ fontSize: 13, fontWeight: 600 }}>{j.author}</div>
                    <div style={{ fontSize: 12, color: '#8B8B8B' }}>Размещено проектов на бирже: {j.postedProjects}</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, alignItems: 'center' }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= j.rating} size={14} />)}
                  <span style={{ fontSize: 12, color: '#8B8B8B', marginLeft: 8 }}>{j.reviews} отзывов</span>
                </div>
              </div>
              <div style={{ textAlign: 'right' }}>
                <div style={{ color: '#21B349', fontWeight: 700, fontSize: 16 }}>Бюджет: {j.budget.toLocaleString()} тенге</div>
                <div style={{ fontSize: 12, color: '#8B8B8B', marginTop: 4 }}>{j.time}</div>
                <div style={{ fontSize: 13, color: '#8B8B8B', marginTop: 12 }}>Предложений: {j.offers}</div>
              </div>
            </div>
          ))}
          {visible < 16 && (
            <div style={{ textAlign: 'center', marginTop: 32 }}>
              <button onClick={() => setVisible(v => v + 6)} className="btn btn-outline" style={{ padding: '12px 40px' }}>Загрузить еще</button>
            </div>
          )}
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './exchange';" > src/pages/exchange/index.js

cat > src/pages/works/works.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
export const WorksPage = () => {
  const nav = useNavigate();
  const works = [...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS];
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '60px 0' }}>
        <div className="container">
          <h1 className="section-title">65 ворков по дизайну</h1>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 24, flexWrap: 'wrap', gap: 16 }}>
            <input className="input" placeholder="Какую работу ищете?" style={{ maxWidth: 400 }} />
            <select className="input" style={{ width: 200 }}><option>По возрастанию цены</option></select>
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            {works.slice(0, 12).map((w, i) => (
              <WorkCard key={i} work={{ ...w, avatar: 'https://i.pravatar.cc/60?img=' + (20 + i) }} onOrder={() => nav('/exchange')} />
            ))}
          </div>
          <div style={{ textAlign: 'center', marginTop: 40 }}>
            <button className="btn btn-outline" style={{ padding: '12px 40px' }}>Загрузить еще</button>
          </div>
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './works';" > src/pages/works/index.js

cat > src/pages/contests/contests.jsx << 'XEOFX'
export const ContestsPage = () => (
  <div className="pageFadeIn">
    <section style={{ padding: '60px 0' }}>
      <div className="container">
        <h1 className="section-title">Конкурсы</h1>
        <div style={{ background: 'white', borderRadius: 16, padding: 40, boxShadow: '0 4px 20px rgba(0,0,0,0.03)' }}>
          <div style={{ display: 'flex', gap: 12, marginBottom: 40, flexWrap: 'wrap' }}>
            {['Что такое конкурс?','Основное','Описание','Оплата','Публикация'].map((s, i) => (
              <div key={s} style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <div style={{ width: 32, height: 32, borderRadius: '50%', background: i === 0 ? '#21B349' : '#E5E5E5', color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 700, fontSize: 13 }}>{i + 1}</div>
                <span style={{ fontSize: 13, fontWeight: 500, color: i === 0 ? '#21B349' : '#8B8B8B' }}>{s}</span>
              </div>
            ))}
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24 }}>
            {[{ t: 'Опубликуйте бриф', d: 'Зарезервируйте бюджет конкурса, и мы уведомим всех исполнителей.' }, { t: 'Получайте варианты', d: 'Участники будут присылать вам готовые работы, которые вы сможете оценивать.' }, { t: 'Выберите победителя', d: 'Определитесь с наилучшей работой на стадии финала и выберите ее победителем.' }, { t: 'Получите готовую работу', d: 'Проведите доработки в рабочей области, если это необходимо.' }].map((s, i) => (
              <div key={i}>
                <div style={{ fontSize: 40, marginBottom: 12 }}>{['📋','🎨','🏆','📦'][i]}</div>
                <h3 style={{ fontSize: 15, fontWeight: 700, marginBottom: 8 }}>{s.t}</h3>
                <p style={{ fontSize: 12, color: '#8B8B8B', lineHeight: 1.6 }}>{s.d}</p>
              </div>
            ))}
          </div>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 40 }}>
            <button className="btn btn-ghost">Назад</button>
            <button className="btn btn-primary">Дальше</button>
          </div>
        </div>
      </div>
    </section>
  </div>
);
XEOFX
echo "export * from './contests';" > src/pages/contests/index.js

cat > src/pages/create-work/create-work.jsx << 'XEOFX'
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
const STEPS = ['Основное','Стоимость и опции','Описание','Требования','Галерея','Публикация'];
export const CreateWorkPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const [step, setStep] = useState(0);
  const next = () => {
    if (step < STEPS.length - 1) setStep(step + 1);
    else { toast('Ворк опубликован!'); nav('/works'); }
  };
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title">Создание ворка</h1>
          <div style={{ display: 'flex', gap: 8, marginBottom: 40, flexWrap: 'wrap' }}>
            {STEPS.map((s, i) => (
              <div key={s} style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <div style={{ width: 36, height: 36, borderRadius: '50%', background: i <= step ? '#21B349' : '#E5E5E5', color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 700, fontSize: 14 }}>{i + 1}</div>
                <span style={{ fontSize: 13, fontWeight: 500, color: i === step ? '#21B349' : '#8B8B8B' }}>{s}</span>
              </div>
            ))}
          </div>
          <div style={{ background: 'white', borderRadius: 16, padding: 40, boxShadow: '0 4px 20px rgba(0,0,0,0.03)', minHeight: 400 }}>
            {step === 0 && (
              <div style={{ display: 'flex', flexDirection: 'column', gap: 20, maxWidth: 600 }}>
                <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Название</label><input className="input" placeholder="Placeholder" /></div>
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
                  <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Категория</label><select className="input"><option>Placeholder</option></select></div>
                  <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Подкатегория</label><select className="input"><option>Placeholder</option></select></div>
                </div>
                <div>
                  <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Теги</label>
                  <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap' }}>
                    {['Тег 1','Тег 2','Дизайн сайта','Тег 1','Тег 2','Дизайн сайта'].map((t, i) => (
                      <span key={i} style={{ padding: '6px 12px', background: '#F5F5F7', borderRadius: 20, fontSize: 12 }}>{t}</span>
                    ))}
                  </div>
                </div>
              </div>
            )}
            {step === 1 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 20 }}>Пакеты</h3>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 20 }}>
                  {['Эконом', 'Стандарт', 'Бизнес'].map(p => (
                    <div key={p} style={{ border: '1px solid #E5E5E5', borderRadius: 12, padding: 20 }}>
                      <h4 style={{ fontSize: 16, fontWeight: 700, textAlign: 'center', marginBottom: 20 }}>{p}</h4>
                      {['Описание пакета','Срок выполнения','Количество доработок','Стоимость в тенге'].map(f => (
                        <div key={f} style={{ marginBottom: 12 }}>
                          <label style={{ fontSize: 12, fontWeight: 600, display: 'block', marginBottom: 4 }}>{f}</label>
                          <input className="input" placeholder="Placeholder" style={{ padding: '8px 12px', fontSize: 13 }} />
                        </div>
                      ))}
                      <button className="btn btn-light btn-full btn-sm" style={{ marginTop: 8 }}>Добавить опцию</button>
                    </div>
                  ))}
                </div>
              </div>
            )}
            {step === 2 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Описание</h3>
                <textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 150, marginBottom: 32 }} />
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Часто задаваемые вопросы</h3>
                <input className="input" placeholder="Вопрос" style={{ marginBottom: 12 }} />
                <input className="input" placeholder="Ответ" style={{ marginBottom: 12 }} />
              </div>
            )}
            {step === 3 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Расскажите покупателю, что вам нужно для начала работы над заказом.</h3>
                <textarea className="input" placeholder="Кратко опишите требования" style={{ minHeight: 200 }} />
              </div>
            )}
            {step === 4 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Создайте свою галерею</h3>
                <div style={{ background: '#FFE4E4', borderRadius: 12, aspectRatio: '4/3', maxWidth: 300, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', border: '2px dashed #FBA457', marginBottom: 20 }}>
                  <div style={{ fontSize: 32, color: '#FBA457' }}>+</div>
                  <div style={{ fontSize: 12, color: '#FBA457', fontWeight: 600 }}>Добавить фото</div>
                </div>
              </div>
            )}
            {step === 5 && (
              <div style={{ textAlign: 'center', padding: '40px 0' }}>
                <h3 style={{ fontSize: 24, fontWeight: 800, marginBottom: 12 }}>Поздравляем!</h3>
                <p style={{ fontSize: 14, color: '#8B8B8B', marginBottom: 32 }}>Ваш ворк готов к публикации</p>
                <div style={{ fontSize: 100 }}>🎉</div>
              </div>
            )}
            <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 40 }}>
              <button onClick={() => step > 0 ? setStep(step - 1) : nav(-1)} className="btn btn-ghost" style={{ padding: '12px 40px' }}>Назад</button>
              <button onClick={next} className="btn btn-primary" style={{ padding: '12px 40px' }}>{step === STEPS.length - 1 ? 'Опубликовать' : 'Дальше'}</button>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './create-work';" > src/pages/create-work/index.js

cat > src/pages/create-order/create-order.jsx << 'XEOFX'
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
export const CreateOrderPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const [form, setForm] = useState({ title: '', desc: '', days: 14, budget: 250000 });
  const submit = (e) => {
    e.preventDefault();
    if (!form.title || !form.desc) { toast('Заполните обязательные поля'); return; }
    toast('Заказ опубликован!');
    nav('/my-orders');
  };
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0 80px' }}>
        <div className="container" style={{ maxWidth: 800 }}>
          <h1 className="section-title">Опубликуйте ваш заказ</h1>
          <form onSubmit={submit} style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
            <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Название</label><input className="input" placeholder="Placeholder" value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value })} /></div>
            <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Описание</label><textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 120 }} value={form.desc} onChange={(e) => setForm({ ...form, desc: e.target.value })} /></div>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Категория</label><select className="input"><option>Placeholder</option><option>Дизайн</option></select></div>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Подкатегория</label><select className="input"><option>Placeholder</option></select></div>
            </div>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Срок выполнения в днях</label><input type="number" className="input" value={form.days} onChange={(e) => setForm({ ...form, days: +e.target.value })} /></div>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Бюджет в тенге</label><input type="number" className="input" value={form.budget} onChange={(e) => setForm({ ...form, budget: +e.target.value })} /></div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 20 }}>
              <button type="button" onClick={() => nav(-1)} className="btn btn-ghost" style={{ padding: '12px 40px' }}>Назад</button>
              <button type="submit" className="btn btn-primary" style={{ padding: '12px 40px' }}>Опубликовать</button>
            </div>
          </form>
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './create-order';" > src/pages/create-order/index.js

cat > src/pages/profile/profile.jsx << 'XEOFX'
import { useState } from 'react';
import { useAuth } from 'shared/lib/auth';
import { StarIcon } from 'shared/ui/icon';
export const ProfilePage = () => {
  const { user } = useAuth();
  const [expanded, setExpanded] = useState(false);
  if (!user) return <div className="container" style={{ padding: 60 }}>Войдите в аккаунт</div>;
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 60, alignItems: 'center', marginBottom: 60 }}>
            <div>
              <div style={{ color: '#FBA457', fontWeight: 700, marginBottom: 4 }}>{user.role}</div>
              <h1 style={{ fontSize: 36, fontWeight: 800, marginBottom: 16 }}>{user.name}</h1>
              <p style={{ fontSize: 14, color: '#8B8B8B', lineHeight: 1.7, marginBottom: 20 }}>Работаю дизайнером с 1999 года. Вышло в газетах, журналах, типографиях, рекламных агентствах.</p>
              <div style={{ display: 'flex', gap: 8, marginBottom: 24, flexWrap: 'wrap' }}>
                {['Figma', 'Adobe photoshop', 'Adobe illustrator', 'Corel draw'].map(s => <span key={s} style={{ padding: '4px 12px', background: '#F5F5F7', borderRadius: 20, fontSize: 12 }}>{s}</span>)}
              </div>
              <button onClick={() => setExpanded(!expanded)} className="btn btn-ghost" style={{ padding: '12px 30px' }}>
                {expanded ? 'Скрыть информацию' : 'Показать подробную информацию'}
              </button>
              {expanded && (
                <div style={{ marginTop: 24, background: '#F5F0FF', padding: 24, borderRadius: 12 }}>
                  <div style={{ marginBottom: 8 }}><b>Страна:</b> Казахстан, Алматы</div>
                  <div style={{ marginBottom: 8 }}><b>На сайте:</b> 3 года</div>
                  <div><b>Образование:</b> КазНУ, Бакалавр</div>
                </div>
              )}
            </div>
            <div style={{ textAlign: 'center' }}>
              <div style={{ position: 'relative', display: 'inline-block' }}>
                <img src={user.avatar} alt="" style={{ width: 320, height: 320, borderRadius: '50%', objectFit: 'cover' }} />
                <div style={{ position: 'absolute', bottom: 20, right: 30, background: 'white', padding: '8px 16px', borderRadius: 12, boxShadow: '0 10px 30px rgba(0,0,0,0.1)', display: 'flex', gap: 2 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={16} />)}
                </div>
              </div>
            </div>
          </div>
          <h2 className="section-title">Мой ворки</h2>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            <div style={{ background: '#E8F7EC', borderRadius: 12, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', minHeight: 200, cursor: 'pointer', color: '#21B349' }}>
              <div style={{ width: 60, height: 60, borderRadius: '50%', background: '#21B349', color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 30, marginBottom: 12 }}>+</div>
              <div style={{ fontWeight: 700, fontSize: 16 }}>Создать ворк</div>
            </div>
            {Array(3).fill(null).map((_, i) => (
              <div key={i} className="hoverLift" style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0' }}>
                <img src={`https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=300&sig=${i}`} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
                <div style={{ padding: 16 }}>
                  <div style={{ fontWeight: 700, fontSize: 14, marginBottom: 4 }}>Дизайн сайта</div>
                  <div style={{ color: '#21B349', fontWeight: 700, fontSize: 14 }}>50 000 тенге</div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './profile';" > src/pages/profile/index.js

cat > src/pages/chat/chat.jsx << 'XEOFX'
import { useState } from 'react';
const CHATS = Array(6).fill(null).map((_, i) => ({ id: i + 1, name: 'Никита Евреев', avatar: 'https://i.pravatar.cc/60?img=12', lastMsg: 'Ну че там, сделал?', online: i === 0 }));
export const ChatPage = () => {
  const [active, setActive] = useState(1);
  const [msg, setMsg] = useState('');
  const [messages, setMessages] = useState([
    { id: 1, from: 'them', text: 'Нужно сделать супер крутой дизайн для сайта' },
    { id: 2, from: 'them', text: 'Ну я общем так' },
    { id: 3, from: 'me', text: 'Ок!' },
  ]);
  const send = (e) => {
    e.preventDefault();
    if (!msg.trim()) return;
    setMessages([...messages, { id: Date.now(), from: 'me', text: msg }]);
    setMsg('');
  };
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '30px 0' }}>
        <div className="container">
          <div style={{ display: 'grid', gridTemplateColumns: '320px 1fr', background: 'white', borderRadius: 16, overflow: 'hidden', boxShadow: '0 4px 20px rgba(0,0,0,0.03)', minHeight: 600 }}>
            <div style={{ borderRight: '1px solid #F0F0F0' }}>
              <div style={{ padding: 20 }}><input className="input" placeholder="Поиск" /></div>
              {CHATS.map(c => (
                <div key={c.id} onClick={() => setActive(c.id)} style={{ padding: 16, display: 'flex', gap: 12, cursor: 'pointer', background: active === c.id ? '#E8F7EC' : 'transparent', alignItems: 'center' }}>
                  <div style={{ position: 'relative' }}>
                    <img src={c.avatar} alt="" style={{ width: 44, height: 44, borderRadius: '50%' }} />
                    {c.online && <div style={{ position: 'absolute', bottom: 0, right: 0, width: 12, height: 12, borderRadius: '50%', background: '#21B349', border: '2px solid white' }} />}
                  </div>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontWeight: 700, fontSize: 14 }}>{c.name}</div>
                    <div style={{ fontSize: 12, color: '#8B8B8B', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{c.lastMsg}</div>
                  </div>
                </div>
              ))}
            </div>
            <div style={{ display: 'flex', flexDirection: 'column' }}>
              <div style={{ padding: 16, borderBottom: '1px solid #F0F0F0', display: 'flex', gap: 12, alignItems: 'center' }}>
                <img src="https://i.pravatar.cc/60?img=12" alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
                <div>
                  <div style={{ fontWeight: 700, fontSize: 14 }}>Никита Евреев</div>
                  <div style={{ fontSize: 12, color: '#21B349' }}>Онлайн</div>
                </div>
              </div>
              <div style={{ flex: 1, padding: 20, overflowY: 'auto', display: 'flex', flexDirection: 'column', gap: 12 }}>
                {messages.map(m => (
                  <div key={m.id} style={{ display: 'flex', justifyContent: m.from === 'me' ? 'flex-end' : 'flex-start' }}>
                    <div style={{ maxWidth: '60%', padding: '12px 16px', borderRadius: 16, background: m.from === 'me' ? '#E8F7EC' : '#FFE4CC', fontSize: 14 }}>{m.text}</div>
                  </div>
                ))}
              </div>
              <form onSubmit={send} style={{ padding: 16, borderTop: '1px solid #F0F0F0', display: 'flex', gap: 12 }}>
                <input className="input" placeholder="Введите сообщение" value={msg} onChange={(e) => setMsg(e.target.value)} />
                <button type="submit" className="btn btn-primary">Отправить</button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './chat';" > src/pages/chat/index.js

cat > src/pages/wallet/wallet.jsx << 'XEOFX'
import { WALLET_HISTORY } from 'shared/api/mocks';
import { useToast } from 'shared/lib/toast';
export const WalletPage = () => {
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>Мой <span style={{ color: '#FBA457' }}>кошелек</span></h1>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 20, maxWidth: 900, margin: '0 auto 40px' }}>
            <div style={{ background: '#F5F5F7', borderRadius: 12, padding: 24, textAlign: 'center' }}>
              <div style={{ fontSize: 13, color: '#8B8B8B', marginBottom: 8 }}>Чистый доход</div>
              <div style={{ fontSize: 18, fontWeight: 700 }}>1 000 000 тенге</div>
            </div>
            <div style={{ background: '#F5F5F7', borderRadius: 12, padding: 24, textAlign: 'center' }}>
              <div style={{ fontSize: 13, color: '#8B8B8B', marginBottom: 8 }}>Выведено</div>
              <div style={{ fontSize: 18, fontWeight: 700 }}>500 000 тенге</div>
            </div>
            <div style={{ background: '#F5F5F7', borderRadius: 12, padding: 24, textAlign: 'center' }}>
              <div style={{ fontSize: 13, color: '#8B8B8B', marginBottom: 8 }}>Доступна сумма</div>
              <div style={{ fontSize: 20, fontWeight: 700, color: '#21B349' }}>250 000 тенге</div>
            </div>
          </div>
          <div style={{ maxWidth: 600, margin: '0 auto 40px', textAlign: 'center' }}>
            <div style={{ fontSize: 14, color: '#8B8B8B', marginBottom: 16 }}>Вывести средства на</div>
            <div style={{ display: 'flex', gap: 16, justifyContent: 'center', flexWrap: 'wrap' }}>
              {['QIWI', 'WebMoney', 'VISA', 'MC'].map(p => (
                <div key={p} onClick={() => toast(`Вывод на ${p}`)} style={{ padding: '12px 24px', background: 'white', border: '1px solid #E5E5E5', borderRadius: 8, fontWeight: 700, cursor: 'pointer' }}>{p}</div>
              ))}
            </div>
          </div>
          <h2 className="section-title">История</h2>
          <div style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0' }}>
            <div style={{ display: 'grid', gridTemplateColumns: '60px 1fr 200px 200px 1fr', padding: 16, background: '#F5F5F7', fontWeight: 700, fontSize: 13 }}>
              <div></div><div>Операция</div><div>Дата операции</div><div>Сумма</div><div>Hash операции</div>
            </div>
            {WALLET_HISTORY.map(h => (
              <div key={h.id} style={{ display: 'grid', gridTemplateColumns: '60px 1fr 200px 200px 1fr', padding: 16, borderTop: '1px solid #F0F0F0', alignItems: 'center', fontSize: 13 }}>
                <div style={{ width: 36, height: 36, borderRadius: '50%', background: h.type === 'in' ? '#E8F7EC' : h.type === 'out' ? '#F5F0FF' : '#FFE4CC', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>{h.type === 'in' ? '+' : h.type === 'out' ? '↑' : '🛒'}</div>
                <div>{h.operation}</div>
                <div style={{ color: '#8B8B8B' }}>{h.date}</div>
                <div style={{ fontWeight: 700 }}>{h.amount.toLocaleString()} тенге</div>
                <div style={{ color: '#8B8B8B', fontSize: 11 }}>{h.hash}</div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './wallet';" > src/pages/wallet/index.js

cat > src/pages/purchases/purchases.jsx << 'XEOFX'
import { PURCHASES } from 'shared/api/mocks';
import { useToast } from 'shared/lib/toast';
export const PurchasesPage = () => {
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>История <span style={{ color: '#FBA457' }}>покупок</span></h1>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 32, flexWrap: 'wrap', gap: 16 }}>
            <div style={{ fontSize: 16, fontWeight: 700 }}>Всего 65 сделок</div>
            <div style={{ display: 'flex', gap: 20, alignItems: 'center', fontSize: 13 }}>
              <span style={{ color: '#8B8B8B' }}>Показать только:</span>
              <label style={{ display: 'flex', gap: 6 }}><input type="radio" name="s" defaultChecked /> Выполняется</label>
              <label style={{ display: 'flex', gap: 6 }}><input type="radio" name="s" /> Завершено</label>
            </div>
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            {PURCHASES.map(p => (
              <div key={p.id} className="hoverLift" style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0' }}>
                <img src={`https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400&sig=${p.id}`} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
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
XEOFX
echo "export * from './purchases';" > src/pages/purchases/index.js

cat > src/pages/my-orders/my-orders.jsx << 'XEOFX'
import { useState } from 'react';
import { MY_ORDERS } from 'shared/api/mocks';
export const MyOrdersPage = () => {
  const [tab, setTab] = useState('all');
  const orders = tab === 'all' ? MY_ORDERS : MY_ORDERS.filter(o => o.status === (tab === 'active' ? 'Прием ставок' : 'Завершено'));
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>Мои <span style={{ color: '#FBA457' }}>заказы</span></h1>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 32, flexWrap: 'wrap', gap: 16 }}>
            <div style={{ fontSize: 16, fontWeight: 700 }}>Всего {orders.length} заявок</div>
            <div style={{ display: 'flex', gap: 16 }}>
              {[['all', 'Все'], ['active', 'Активные'], ['done', 'Завершенные']].map(([k, l]) => (
                <button key={k} onClick={() => setTab(k)} style={{ fontWeight: 600, color: tab === k ? '#21B349' : '#8B8B8B', background: 'none', border: 'none', cursor: 'pointer' }}>{l}</button>
              ))}
            </div>
          </div>
          {orders.map(o => (
            <div key={o.id} style={{ background: 'white', borderRadius: 12, padding: 24, marginBottom: 16, display: 'grid', gridTemplateColumns: '1fr auto', gap: 24, boxShadow: '0 4px 20px rgba(0,0,0,0.03)' }}>
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>{o.title}</h3>
                <p style={{ fontSize: 13, color: '#8B8B8B', lineHeight: 1.6, marginBottom: 16, maxWidth: 600 }}>{o.desc}</p>
                <div style={{ color: o.status === 'Прием ставок' ? '#FBA457' : o.status === 'Завершено' ? '#21B349' : '#F04438', fontWeight: 600, fontSize: 13 }}>{o.status}</div>
              </div>
              <div style={{ textAlign: 'right' }}>
                <div style={{ color: '#21B349', fontWeight: 700, fontSize: 16 }}>Бюджет: {o.budget.toLocaleString()} тенге</div>
                <div style={{ fontSize: 12, color: '#8B8B8B', marginTop: 4 }}>{o.time}</div>
                <div style={{ fontSize: 13, color: '#8B8B8B', marginTop: 12 }}>Предложений: {o.offers}</div>
              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
};
XEOFX
echo "export * from './my-orders';" > src/pages/my-orders/index.js

cat > src/pages/favorites/favorites.jsx << 'XEOFX'
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
                <img src={`https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400&sig=f${f.id}`} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
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
XEOFX
echo "export * from './favorites';" > src/pages/favorites/index.js

cat > src/pages/not-found/not-found.jsx << 'XEOFX'
import { useNavigate } from 'react-router-dom';
export const NotFoundPage = () => {
  const nav = useNavigate();
  return (
    <div className="pageFadeIn" style={{ minHeight: '60vh', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', padding: 60, textAlign: 'center' }}>
      <h1 style={{ fontSize: 160, fontWeight: 900, color: '#21B349', lineHeight: 1, marginBottom: 20 }}>404</h1>
      <h2 style={{ fontSize: 28, fontWeight: 800, marginBottom: 12 }}>Страница не найдена</h2>
      <p style={{ color: '#8B8B8B', marginBottom: 32 }}>Возможно, страница была удалена или временно недоступна.</p>
      <button className="btn btn-primary" onClick={() => nav('/')}>На главную</button>
    </div>
  );
};
XEOFX
echo "export * from './not-found';" > src/pages/not-found/index.js

echo "[5/6] pages done"

# =========== APP CORE ===========
cat > src/shared/lib/auth/auth-context.jsx << 'XEOFX'
import { createContext, useContext, useState } from 'react';
const Ctx = createContext();
export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState({
    name: 'Ернар Ибрагимов',
    role: 'Дизайнер',
    email: 'ernar@worktap.kz',
    avatar: 'https://i.pravatar.cc/100?img=12',
    balance: 250000,
  });
  const logout = () => setUser(null);
  const login = () => setUser({ name: 'Ернар Ибрагимов', role: 'Дизайнер', avatar: 'https://i.pravatar.cc/100?img=12', balance: 250000 });
  return <Ctx.Provider value={{ user, login, logout }}>{children}</Ctx.Provider>;
};
export const useAuth = () => useContext(Ctx);
XEOFX
echo "export * from './auth-context';" > src/shared/lib/auth/index.js

cat > src/shared/lib/index.js << 'XEOFX'
export * from './hooks';
export * from './toast';
export * from './auth';
XEOFX

cat > src/app/layouts/main-layout.jsx << 'XEOFX'
import { useState } from 'react';
import { Outlet } from 'react-router-dom';
import { Header } from 'widgets/header';
import { Footer } from 'widgets/footer';
import { AuthModals } from 'widgets/auth-modals';
import { InfoModals } from 'widgets/info-modals';
export const MainLayout = () => {
  const [authOpen, setAuthOpen] = useState(false);
  const [authMode, setAuthMode] = useState('login');
  const [info, setInfo] = useState(null);
  return (
    <div>
      <Header onOpenAuth={(m) => { setAuthMode(m || 'login'); setAuthOpen(true); }} onOpenInfo={setInfo} />
      <main><Outlet /></main>
      <Footer />
      <AuthModals isOpen={authOpen} mode={authMode} onClose={() => setAuthOpen(false)} onSwitch={(m) => setAuthMode(m)} />
      <InfoModals type={info} onClose={() => setInfo(null)} />
    </div>
  );
};
XEOFX
echo "export * from './main-layout';" > src/app/layouts/index.js

cat > src/app/router/router.jsx << 'XEOFX'
import { createBrowserRouter } from 'react-router-dom';
import { MainLayout } from 'app/layouts';
import { HomePage } from 'pages/home';
import { ExchangePage } from 'pages/exchange';
import { WorksPage } from 'pages/works';
import { ContestsPage } from 'pages/contests';
import { CreateWorkPage } from 'pages/create-work';
import { CreateOrderPage } from 'pages/create-order';
import { ProfilePage } from 'pages/profile';
import { ChatPage } from 'pages/chat';
import { WalletPage } from 'pages/wallet';
import { PurchasesPage } from 'pages/purchases';
import { MyOrdersPage } from 'pages/my-orders';
import { FavoritesPage } from 'pages/favorites';
import { NotFoundPage } from 'pages/not-found';
export const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'exchange', element: <ExchangePage /> },
      { path: 'works', element: <WorksPage /> },
      { path: 'contests', element: <ContestsPage /> },
      { path: 'create-work', element: <CreateWorkPage /> },
      { path: 'create-order', element: <CreateOrderPage /> },
      { path: 'profile', element: <ProfilePage /> },
      { path: 'chat', element: <ChatPage /> },
      { path: 'wallet', element: <WalletPage /> },
      { path: 'purchases', element: <PurchasesPage /> },
      { path: 'my-orders', element: <MyOrdersPage /> },
      { path: 'favorites', element: <FavoritesPage /> },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
]);
XEOFX
echo "export * from './router';" > src/app/router/index.js

cat > src/app/app.jsx << 'XEOFX'
import { RouterProvider } from 'react-router-dom';
import { ToastProvider } from 'shared/lib/toast';
import { AuthProvider } from 'shared/lib/auth';
import { router } from './router';
export const App = () => (
  <ToastProvider>
    <AuthProvider>
      <RouterProvider router={router} />
    </AuthProvider>
  </ToastProvider>
);
XEOFX

cat > src/main.jsx << 'XEOFX'
import React from 'react';
import ReactDOM from 'react-dom/client';
import { App } from 'app/app';
import 'app/styles/index.css';
import 'app/styles/animations.css';
ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode><App /></React.StrictMode>
);
XEOFX

echo "[6/6] app core done"

echo ""
echo "================================"
echo "ALL DONE - проверь:"
echo "================================"
ls src/app/
ls src/app/layouts/
ls src/app/router/
ls src/pages/
ls src/widgets/
ls src/entities/
echo ""
echo "Запусти: npm run dev"
