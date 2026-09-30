mkdir -p src/pages/{login,signup,reset-password,new-password}
mkdir -p src/pages/work-detail
mkdir -p src/pages/order-freelancer
mkdir -p src/pages/order-bid
mkdir -p src/pages/order-owner
mkdir -p src/pages/contest-freelancer
mkdir -p src/pages/contest-bid
mkdir -p src/pages/contest-take-part
mkdir -p src/pages/contest-owner
mkdir -p src/app/layouts

# ========= AUTH LAYOUT (левая форма + правая картинка) =========
cat > src/app/layouts/auth-layout.module.css << 'END'
.wrap { display: grid; grid-template-columns: 1fr 1fr; min-height: 100vh; background: #fff; }
.left { padding: 60px 80px; display: flex; flex-direction: column; justify-content: center; max-width: 600px; }
.logo { display: flex; align-items: center; gap: 8px; margin-bottom: 60px; }
.logo img { height: 36px; }
.logoText { font-size: 20px; font-weight: 800; }
.right {
  background: linear-gradient(135deg, #FFF5EB 0%, #FFE4CC 100%);
  position: relative;
  display: flex;
  align-items: flex-end;
  padding: 60px;
}
.bg {
  position: absolute;
  inset: 0;
  background-size: cover;
  background-position: center;
  opacity: 0.9;
}
.tip {
  position: relative;
  z-index: 1;
  background: #fff;
  padding: 16px 20px;
  border-radius: var(--r);
  font-size: 13px;
  color: var(--c-gray);
  line-height: 1.5;
  max-width: 400px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  margin-bottom: 60px;
}
.dots { position: absolute; bottom: 30px; left: 50%; transform: translateX(-50%); display: flex; gap: 8px; z-index: 2; }
.dot { width: 10px; height: 10px; border-radius: 50%; background: #fff; opacity: 0.5; }
.dotActive { background: var(--c-peach); opacity: 1; }
@media (max-width: 900px) { .wrap { grid-template-columns: 1fr; } .right { display: none; } .left { padding: 40px 24px; } }
END

cat > src/app/layouts/auth-layout.jsx << 'END'
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
END
echo "export * from './auth-layout';" > src/app/layouts/auth-index.js

# ========= LOGIN PAGE =========
cat > src/pages/login/login.module.css << 'END'
.wrap { max-width: 420px; }
.greet { font-size: 13px; color: var(--c-gray); margin-bottom: 6px; }
.title { font-size: 28px; font-weight: 800; margin-bottom: 32px; }
.form { display: flex; flex-direction: column; gap: 20px; }
.label { font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px; }
.row { display: flex; justify-content: space-between; align-items: center; font-size: 13px; }
.check { display: flex; gap: 8px; align-items: center; }
.forgot { color: var(--c-peach); }
.submit { padding: 14px; font-size: 14px; border-radius: var(--r-pill); margin-top: 8px; }
.google {
  padding: 14px; font-size: 14px; border-radius: var(--r-pill);
  background: var(--c-dark); color: #fff;
  display: flex; align-items: center; justify-content: center; gap: 8px;
  font-weight: 600; cursor: pointer; border: none;
}
.google:hover { background: #000; }
.bottom { font-size: 13px; color: var(--c-gray); text-align: center; margin-top: 16px; }
.link { color: var(--c-peach); font-weight: 600; }
END

cat > src/pages/login/login.jsx << 'END'
import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import styles from './login.module.css';

export const LoginPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const { login } = useAuth();
  const [email, setEmail] = useState('');
  const [pwd, setPwd] = useState('');

  const submit = (e) => {
    e.preventDefault();
    if (!email.includes('@')) { toast('Введите корректный email'); return; }
    if (pwd.length < 4) { toast('Пароль минимум 4 символа'); return; }
    login(email);
    toast('Вы вошли в аккаунт');
    nav('/');
  };

  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Добро пожаловать!</div>
      <h1 className={styles.title}>Войдите в свой аккаунт</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>E-mail</label>
          <input className="input" placeholder="E-mail" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        </div>
        <div>
          <label className={styles.label}>Пароль</label>
          <input className="input" placeholder="Пароль" type="password" value={pwd} onChange={(e) => setPwd(e.target.value)} />
        </div>
        <div className={styles.row}>
          <label className={styles.check}><input type="checkbox" /> Запомнить меня</label>
          <Link to="/reset-password" className={styles.forgot}>Забыли пароль?</Link>
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Войти</button>
        <button type="button" className={styles.google}>
          <span>G</span> Или войдите с помощью Google
        </button>
      </form>
      <div className={styles.bottom}>
        У Вас все еще нет аккаунта? <Link to="/signup" className={styles.link}>Зарегистрируйтесь бесплатно!</Link>
      </div>
    </div>
  );
};
END
echo "export * from './login';" > src/pages/login/index.js

# ========= SIGNUP PAGE =========
cat > src/pages/signup/signup.module.css << 'END'
.wrap { max-width: 420px; }
.greet { font-size: 13px; color: var(--c-gray); margin-bottom: 6px; }
.title { font-size: 28px; font-weight: 800; margin-bottom: 32px; }
.form { display: flex; flex-direction: column; gap: 16px; }
.label { font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px; }
.roles { display: flex; gap: 24px; margin: 8px 0; }
.role { display: flex; gap: 8px; align-items: center; font-size: 13px; }
.submit { padding: 14px; font-size: 14px; border-radius: var(--r-pill); margin-top: 8px; }
.bottom { font-size: 13px; color: var(--c-gray); text-align: center; margin-top: 16px; }
.link { color: var(--c-peach); font-weight: 600; }
END

cat > src/pages/signup/signup.jsx << 'END'
import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import styles from './signup.module.css';

export const SignupPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const { login } = useAuth();
  const [role, setRole] = useState('freelancer');

  const submit = (e) => {
    e.preventDefault();
    toast('Регистрация успешна!');
    login('new@user.kz');
    nav('/');
  };

  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Давайте создадим Вам аккаунт</div>
      <h1 className={styles.title}>Заполните все поля</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>Ваше имя</label>
          <input className="input" placeholder="Имя" />
        </div>
        <div>
          <label className={styles.label}>Ваше фамилия</label>
          <input className="input" placeholder="Фамилия" />
        </div>
        <div>
          <label className={styles.label}>E-mail</label>
          <input className="input" placeholder="E-mail" type="email" />
        </div>
        <div>
          <label className={styles.label}>Телефон номер</label>
          <input className="input" placeholder="Телефон" />
        </div>
        <div>
          <label className={styles.label}>Пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <div>
          <label className={styles.label}>Повтарите пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <div className={styles.roles}>
          <label className={styles.role}><input type="radio" checked={role === 'freelancer'} onChange={() => setRole('freelancer')} /> Я исполнитель</label>
          <label className={styles.role}><input type="radio" checked={role === 'client'} onChange={() => setRole('client')} /> Я заказчик</label>
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Зарегистрироваться</button>
      </form>
      <div className={styles.bottom}>
        У Вас есть аккаунт? <Link to="/login" className={styles.link}>Войдите</Link>
      </div>
    </div>
  );
};
END
echo "export * from './signup';" > src/pages/signup/index.js

# ========= RESET PASSWORD =========
cat > src/pages/reset-password/reset-password.module.css << 'END'
.wrap { max-width: 420px; }
.greet { font-size: 13px; color: var(--c-gray); margin-bottom: 6px; }
.title { font-size: 28px; font-weight: 800; margin-bottom: 32px; }
.form { display: flex; flex-direction: column; gap: 20px; }
.label { font-size: 13px; font-weight: 600; display: block; margin-bottom: 6px; }
.submit { padding: 14px; font-size: 14px; border-radius: var(--r-pill); }
.bottom { font-size: 13px; color: var(--c-gray); text-align: center; margin-top: 16px; }
.link { color: var(--c-peach); font-weight: 600; }
END

cat > src/pages/reset-password/reset-password.jsx << 'END'
import { useNavigate, Link } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
import styles from './reset-password.module.css';

export const ResetPasswordPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const submit = (e) => {
    e.preventDefault();
    toast('Код отправлен на email');
    nav('/new-password');
  };
  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Мы отправим Вам код для восстановления пароля</div>
      <h1 className={styles.title}>Заполните поле ниже</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>E-mail</label>
          <input className="input" placeholder="E-mail" type="email" />
        </div>
        <div>
          <label className={styles.label}>Код</label>
          <input className="input" placeholder="Код из почты" />
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Отправить код</button>
      </form>
      <div className={styles.bottom}>
        Вспомнили пароль? <Link to="/login" className={styles.link}>Войдите</Link>
      </div>
    </div>
  );
};
END
echo "export * from './reset-password';" > src/pages/reset-password/index.js

# ========= NEW PASSWORD =========
cat > src/pages/new-password/new-password.module.css << 'END'
@import '../reset-password/reset-password.module.css';
END

cat > src/pages/new-password/new-password.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
import styles from './new-password.module.css';

export const NewPasswordPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const submit = (e) => {
    e.preventDefault();
    toast('Пароль изменён');
    nav('/login');
  };
  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Давайте восстановим Вам пароль</div>
      <h1 className={styles.title}>Придумайте новый пароль</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>Пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <div>
          <label className={styles.label}>Повтарите пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Изменить пароль</button>
      </form>
    </div>
  );
};
END
echo "export * from './new-password';" > src/pages/new-password/index.js

# ========= WORK DETAIL =========
cat > src/pages/work-detail/work-detail.module.css << 'END'
.section { padding: 40px 0; }
.layout { display: grid; grid-template-columns: 1fr 380px; gap: 40px; }
.breadcrumbs { font-size: 13px; color: var(--c-gray); margin-bottom: 16px; }
.title { font-size: 28px; font-weight: 800; margin-bottom: 16px; }
.gallery { display: grid; grid-template-columns: repeat(3, 1fr); gap: 12px; margin-bottom: 24px; }
.gallery img { border-radius: var(--r); aspect-ratio: 4/3; object-fit: cover; width: 100%; }
.tabs { display: flex; gap: 24px; border-bottom: 1px solid var(--c-border); margin-bottom: 32px; }
.tab { padding: 14px 0; font-weight: 600; color: var(--c-gray); cursor: pointer; border-bottom: 2px solid transparent; background: none; border-top: none; border-left: none; border-right: none; }
.tabActive { color: var(--c-dark); border-color: var(--c-primary); }
.block { margin-bottom: 32px; }
.block h3 { font-size: 16px; font-weight: 700; margin-bottom: 12px; }
.block p, .block li { font-size: 14px; color: var(--c-gray); line-height: 1.7; }
.block ul { padding-left: 20px; }
.faq { border-bottom: 1px solid var(--c-border); padding: 16px 0; }
.faqTitle { font-weight: 600; font-size: 14px; display: flex; justify-content: space-between; cursor: pointer; }
.faqText { margin-top: 10px; font-size: 13px; color: var(--c-gray); }

.side { position: sticky; top: 100px; height: fit-content; }
.card { background: #fff; border: 1px solid var(--c-border); border-radius: var(--r); padding: 24px; margin-bottom: 16px; }
.cardTitle { font-size: 16px; font-weight: 700; margin-bottom: 12px; }
.price { font-size: 24px; font-weight: 800; color: var(--c-primary); margin-bottom: 8px; }
.meta { font-size: 13px; color: var(--c-gray); margin-bottom: 16px; }
.option { display: flex; justify-content: space-between; padding: 10px 0; font-size: 13px; border-bottom: 1px solid #F0F0F0; }
.packageBtn { width: 100%; padding: 14px; background: var(--c-primary); color: #fff; border-radius: var(--r-sm); font-weight: 600; margin-top: 12px; border: none; cursor: pointer; }
.packageBtnOutline { background: transparent; border: 1.5px solid var(--c-primary); color: var(--c-primary); }
.author { display: flex; gap: 12px; align-items: center; margin-bottom: 12px; }
.author img { width: 56px; height: 56px; border-radius: 50%; }
.authorName { font-weight: 700; }
.authorRole { font-size: 12px; color: var(--c-gray); }
.tags { display: flex; gap: 6px; flex-wrap: wrap; margin-top: 12px; }
.tag { padding: 4px 10px; background: var(--c-bg); border-radius: var(--r-pill); font-size: 12px; }

.reviews { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-top: 20px; }
@media (max-width: 900px) { .layout { grid-template-columns: 1fr; } .side { position: static; } .reviews { grid-template-columns: 1fr; } }
END

cat > src/pages/work-detail/work-detail.jsx << 'END'
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { REVIEWS } from 'shared/api/mocks';
import { ReviewCard } from 'entities/review';
import { StarIcon } from 'shared/ui/icon';
import { IMAGES } from 'shared/config/images';
import { useToast } from 'shared/lib/toast';
import styles from './work-detail.module.css';

const FAQ = [
  { q: 'Исходники будут?', a: 'Да, исходные файлы передаются вместе с работой.' },
  { q: 'А в каком формате я получу исходники?', a: 'Все популярные форматы: .fig, .psd, .ai, .png, .jpg' },
  { q: 'А что если мне не понравится дизайн?', a: 'Мы сможем доработать, пока вам не понравится.' },
];

export const WorkDetailPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const [tab, setTab] = useState('desc');
  const [openFaq, setOpenFaq] = useState(-1);

  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.breadcrumbs}>Главная / Все категории / Ворки</div>
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Дизайн сайта</h1>
              <div className={styles.gallery}>
                {/* ЗАМЕНИ КАРТИНКИ ЧЕРЕЗ IMAGES.workImage1... */}
                <img src={IMAGES.workImage1} alt="" />
                <img src={IMAGES.workImage2} alt="" />
                <img src={IMAGES.workImage3} alt="" />
              </div>

              <div className={styles.tabs}>
                {[['desc','Описание'],['req','Требования к заказчику'],['rev','Отзывы (65)']].map(([k, l]) => (
                  <button key={k} className={`${styles.tab} ${tab === k ? styles.tabActive : ''}`} onClick={() => setTab(k)}>{l}</button>
                ))}
              </div>

              {tab === 'desc' && (
                <div>
                  <div className={styles.block}>
                    <h3>Об этом ворке</h3>
                    <p>Почему бы вам не отдохнуть этот ворк, чтобы изучить несколько способов, которые помогут вам заработать на жизнь и получать удовольствие от работы. KZT — не просто увлечение, это может быть большая работа. Наши эксперты дизайнеры готовы предложить вам дизайн-решения.</p>
                  </div>
                  <div className={styles.block}>
                    <h3>Часто задаваемые вопросы</h3>
                    {FAQ.map((f, i) => (
                      <div key={i} className={styles.faq}>
                        <div className={styles.faqTitle} onClick={() => setOpenFaq(openFaq === i ? -1 : i)}>
                          <span>{f.q}</span>
                          <span>{openFaq === i ? '−' : '+'}</span>
                        </div>
                        {openFaq === i && <div className={styles.faqText}>{f.a}</div>}
                      </div>
                    ))}
                  </div>
                  <div className={styles.block}>
                    <h3>Требования к заказчику</h3>
                    <ul>
                      <li>Предоставить Технические задание</li>
                      <li>Предоставить примеры дизайна</li>
                      <li>Указать целевую аудиторию</li>
                    </ul>
                  </div>
                  <div className={styles.block}>
                    <h3>Отзывы</h3>
                    <div className={styles.reviews}>
                      {REVIEWS.slice(0, 3).map(r => <ReviewCard key={r.id} review={r} />)}
                    </div>
                  </div>
                </div>
              )}
              {tab === 'req' && <p className={styles.block} style={{ color: 'var(--c-gray)' }}>Требования к заказчику будут указаны здесь.</p>}
              {tab === 'rev' && (
                <div className={styles.reviews}>
                  {REVIEWS.map(r => <ReviewCard key={r.id} review={r} />)}
                </div>
              )}
            </div>

            <aside className={styles.side}>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Эконом пакет</h3>
                <div className={styles.price}>50 000 тг</div>
                <div className={styles.meta}>Сделаю за 5 дней</div>
                <div className={styles.option}><span>Количество доработок 5</span></div>
                <div className={styles.option}><span>Переменная 1</span></div>
                <div className={styles.option}><span>Переменная 2</span></div>
                <button className={styles.packageBtn} onClick={() => { toast('Заказ оформлен!'); nav('/purchases'); }}>Добавить в заказ</button>
              </div>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Стандарт пакет</h3>
                <div className={styles.option}><span>Количество доработок 5</span></div>
                <button className={`${styles.packageBtn} ${styles.packageBtnOutline}`} onClick={() => toast('Выбран стандарт')}>Выбрать</button>
              </div>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Премиум пакет</h3>
                <div className={styles.option}><span>Количество доработок 10</span></div>
                <button className={`${styles.packageBtn} ${styles.packageBtnOutline}`} onClick={() => toast('Выбран премиум')}>Выбрать</button>
              </div>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Исполнитель</h3>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Заказов сделано: 25</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                </div>
                <div className={styles.tags}>
                  {['Дизайн сайта','Веб дизайн','UX UI дизайн'].map(t => <span key={t} className={styles.tag}>{t}</span>)}
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './work-detail';" > src/pages/work-detail/index.js

echo ""
echo "PART 1 DONE"
