mkdir -p src/widgets/auth-modals src/widgets/info-modals
mkdir -p src/entities/review
mkdir -p src/pages/exchange src/pages/works src/pages/contests

# ============ HERO (правильный заголовок) ============
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
        <div className={styles.left}>
          <h1 className={styles.title}>
            Покупайте фриланс-услуги<br />
            в <span className={styles.hl}>два клика</span>
          </h1>
          <p className={styles.subtitle}>Ворк — единица работы продавца, которую можно купить как товар в магазине</p>
          <div className={styles.searchRow}>
            <input className="input" placeholder="Что нужно сделать?" />
            <button className="btn btn-peach">Найти</button>
          </div>
          <div className={styles.tagsTitle}>Выберите рубрику, чтобы начать</div>
          <div className={styles.tags}>
            {TAGS.map(c => (
              <button key={c} className={styles.tag} onClick={() => nav(`/exchange?cat=${c}`)}>{c}</button>
            ))}
            <button className={styles.tagAll} onClick={() => nav('/exchange')}>Все категории</button>
          </div>
        </div>

        {/* ЗАМЕНИ ФОТО В IMAGES.heroAvatar (src/shared/config/images.js) */}
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

cat > src/widgets/home-sections/hero/hero.module.css << 'END'
.section { background: linear-gradient(135deg, #FFF5EB 0%, #FFF 60%); padding: 60px 0 100px; overflow: hidden; }
.inner {
  max-width: 1230px; margin: 0 auto; padding: 0 20px;
  display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center;
}
.left { animation: fadeIn 0.6s ease; }
.title { font-size: 46px; font-weight: 800; line-height: 1.15; margin-bottom: 20px; letter-spacing: -1px; }
.hl { color: var(--c-primary); }
.subtitle { font-size: 16px; color: var(--c-gray); line-height: 1.6; margin-bottom: 32px; max-width: 460px; }
.searchRow { display: flex; gap: 8px; margin-bottom: 40px; max-width: 520px; }
.searchRow input { flex: 1; padding: 14px 20px; border-radius: var(--r-pill); }
.searchRow .btn { padding: 14px 36px; border-radius: var(--r-pill); }

.tagsTitle { font-size: 13px; color: var(--c-gray); margin-bottom: 14px; }
.tags { display: flex; gap: 10px; flex-wrap: wrap; }
.tag {
  background: none; border: none; cursor: pointer;
  color: var(--c-dark); font-size: 13px; padding: 4px 0;
  transition: color var(--t);
}
.tag:hover { color: var(--c-primary); }
.tagAll {
  padding: 6px 14px; border: 1px solid var(--c-peach);
  border-radius: var(--r-pill); color: var(--c-peach);
  background: none; cursor: pointer;
  font-size: 12px; font-weight: 600;
  transition: all var(--t);
}
.tagAll:hover { background: var(--c-peach); color: #fff; }

/* Правая часть */
.right { position: relative; text-align: center; animation: fadeIn 0.8s ease; }
.circle {
  width: 380px; height: 380px; border-radius: 50%; background: var(--c-peach-l);
  margin: 0 auto; display: flex; align-items: center; justify-content: center;
  position: relative;
}
.circle img {
  width: 260px; height: 260px; border-radius: 50%; object-fit: cover;
  object-position: top;
}
.rating {
  position: absolute; bottom: 60px; right: -10px;
  background: #fff; padding: 10px 18px; border-radius: var(--r);
  box-shadow: var(--sh); display: flex; gap: 4px;
  animation: fadeInScale 1s ease 0.3s backwards;
}
.rating span { color: #FFB800; font-size: 18px; }

@media (max-width: 900px) {
  .inner { grid-template-columns: 1fr; gap: 40px; }
  .title { font-size: 30px; }
  .right { display: none; }
}
END

# ============ AUTH MODAL ============
cat > src/widgets/auth-modals/auth-modals.module.css << 'END'
.title { font-size: 24px; font-weight: 800; margin-bottom: 8px; text-align: center; }
.subtitle { font-size: 13px; color: var(--c-gray); text-align: center; margin-bottom: 24px; }
.form { display: flex; flex-direction: column; gap: 16px; }
.submit { padding: 14px; font-size: 14px; }
.bottom { text-align: center; margin-top: 16px; font-size: 13px; color: var(--c-gray); }
.switch {
  color: var(--c-primary); font-weight: 700;
  background: none; border: none; cursor: pointer;
}
END

cat > src/widgets/auth-modals/auth-modals.jsx << 'END'
import { useState } from 'react';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import { Modal } from 'shared/ui/modal';
import styles from './auth-modals.module.css';

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
      <h2 className={styles.title}>{isLogin ? 'Вход' : 'Регистрация'}</h2>
      <p className={styles.subtitle}>{isLogin ? 'Войдите в свой аккаунт' : 'Создайте новый аккаунт'}</p>
      <form className={styles.form} onSubmit={submit}>
        {!isLogin && <input className="input" placeholder="ФИО" />}
        <input className="input" placeholder="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        <input className="input" placeholder="Пароль" type="password" value={pwd} onChange={(e) => setPwd(e.target.value)} />
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>
          {isLogin ? 'Войти' : 'Зарегистрироваться'}
        </button>
      </form>
      <div className={styles.bottom}>
        {isLogin ? 'Нет аккаунта? ' : 'Уже есть аккаунт? '}
        <button className={styles.switch} onClick={() => onSwitch(isLogin ? 'signup' : 'login')}>
          {isLogin ? 'Регистрация' : 'Войти'}
        </button>
      </div>
    </Modal>
  );
};
END

# ============ INFO MODALS ============
cat > src/widgets/info-modals/info-modals.module.css << 'END'
.title { font-size: 28px; font-weight: 800; margin-bottom: 24px; text-align: center; }
.text { font-size: 14px; line-height: 1.7; color: #4B4B4B; }
.grid4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.stepNum {
  width: 40px; height: 40px; border-radius: 50%;
  background: var(--c-primary-l); color: var(--c-primary);
  display: flex; align-items: center; justify-content: center;
  font-weight: 700; margin-bottom: 12px;
}
.stepTitle { font-weight: 700; font-size: 14px; margin-bottom: 8px; }
.stepDesc { font-size: 12px; color: var(--c-gray); line-height: 1.5; }
.btnRow { text-align: center; margin-top: 32px; }
.btnOk { padding: 12px 60px; border-radius: var(--r-pill); }
@media (max-width: 700px) { .grid4 { grid-template-columns: 1fr 1fr; } }
END

cat > src/widgets/info-modals/info-modals.jsx << 'END'
import { Modal } from 'shared/ui/modal';
import styles from './info-modals.module.css';

const HOW_STEPS = [
  { n: 1, t: 'Укажите вид работы и категорию' },
  { n: 2, t: 'Выберите специалиста', d: 'Каждый специалист перед началом работы проходит тщательную проверку, имеет рейтинг и отзывы.' },
  { n: 3, t: 'Оплатите услугу' },
  { n: 4, t: 'Специалист выполняет работу', d: 'После выполнения заказа у вас будет возможность поставить оценку и написать отзыв.' },
];

const CONTENT = {
  about: {
    title: 'О нас',
    body: <p className={styles.text}>WorkTap — онлайн сервис поиска частных специалистов для решения бизнес задач в кратчайшие сроки. Наша платформа объединяет заказчиков услуг, которым необходимо выполнить какую-либо работу, и компетентных специалистов, ищущих подработку или дополнительный заработок.</p>,
  },
  how: {
    title: 'Как это работает',
    body: (
      <div className={styles.grid4}>
        {HOW_STEPS.map(s => (
          <div key={s.n}>
            <div className={styles.stepNum}>{s.n}</div>
            <div className={styles.stepTitle}>{s.t}</div>
            {s.d && <div className={styles.stepDesc}>{s.d}</div>}
          </div>
        ))}
      </div>
    ),
  },
  rules: {
    title: 'Правила сервиса',
    body: (
      <div className={styles.text}>
        <p style={{ marginBottom: 12 }}>1. Пользоваться сервисом worktap.kz может любой человек, достигший совершеннолетия.</p>
        <p style={{ marginBottom: 12 }}>2. У одного человека может быть только один аккаунт.</p>
        <p style={{ marginBottom: 12 }}>3. При регистрации пользователь самостоятельно выбирает логин.</p>
        <p style={{ marginBottom: 12 }}>4. Ответственность за всю размещенную информацию несет сам пользователь.</p>
        <p>5. На сайте запрещена ненормативная лексика, грубое общение.</p>
      </div>
    ),
  },
  privacy: {
    title: 'Политика безопасности',
    body: (
      <div className={styles.text}>
        <p style={{ marginBottom: 12 }}><b>Платежи.</b> Оплата банковской картой онлайн. Наш сайт подключен к интернет-эквайрингу.</p>
        <p style={{ marginBottom: 12 }}><b>CVC2/CVV2.</b> Трёхзначный код безопасности, находящийся на оборотной стороне карты.</p>
        <p>3-D Secure — современная технология обеспечения безопасности платежей по картам в сети интернет.</p>
      </div>
    ),
  },
};

export const InfoModals = ({ type, onClose }) => {
  if (!type || !CONTENT[type]) return null;
  const c = CONTENT[type];
  return (
    <Modal isOpen onClose={onClose} maxWidth={type === 'privacy' ? 900 : 720}>
      <h2 className={styles.title}>{c.title}</h2>
      {c.body}
      <div className={styles.btnRow}>
        <button className={`btn btn-primary ${styles.btnOk}`} onClick={onClose}>Понятно</button>
      </div>
    </Modal>
  );
};
END

# ============ REVIEW CARD ============
cat > src/entities/review/review-card.module.css << 'END'
.card {
  background: #fff; border-radius: var(--r); padding: 20px;
  border: 1px solid #F0F0F0;
}
.head { display: flex; gap: 12px; align-items: center; margin-bottom: 12px; }
.avatar { width: 40px; height: 40px; border-radius: 50%; background: var(--c-border); }
.author { font-weight: 700; font-size: 14px; }
.stars { display: flex; gap: 2px; margin-bottom: 12px; }
.text { font-size: 13px; color: var(--c-gray); line-height: 1.6; }
END

cat > src/entities/review/review-card.jsx << 'END'
import { StarIcon } from 'shared/ui/icon';
import styles from './review-card.module.css';

export const ReviewCard = ({ review }) => (
  <div className={styles.card}>
    <div className={styles.head}>
      <div className={styles.avatar} />
      <div className={styles.author}>{review.author}</div>
    </div>
    <div className={styles.stars}>
      {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= review.rating} size={14} />)}
    </div>
    <p className={styles.text}>{review.text}</p>
  </div>
);
END
echo "export * from './review-card';" > src/entities/review/index.js

# ============ EXCHANGE PAGE ============
mkdir -p src/pages/exchange
cat > src/pages/exchange/exchange.module.css << 'END'
.top { background: linear-gradient(135deg, #FFF5EB 0%, #FFF 60%); padding: 60px 0; text-align: center; }
.title { font-size: 32px; font-weight: 800; margin: 0 auto 24px; max-width: 700px; line-height: 1.2; }
.hl { color: var(--c-primary); }
.searchRow { display: flex; gap: 8px; max-width: 600px; margin: 0 auto 24px; }
.searchRow input { flex: 1; border-radius: var(--r-pill); }
.searchRow .btn { padding: 12px 32px; border-radius: var(--r-pill); }
.tags { display: flex; gap: 10px; justify-content: center; flex-wrap: wrap; }
.tag {
  padding: 6px 14px; border: 1px solid var(--c-border);
  border-radius: var(--r-pill); background: #fff;
  font-size: 12px; cursor: pointer; transition: all var(--t);
}
.tag:hover { border-color: var(--c-primary); color: var(--c-primary); }

.list { padding: 40px 0; }
.listTitle { font-size: 20px; font-weight: 700; margin-bottom: 20px; text-align: center; }
.filters { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; flex-wrap: wrap; gap: 16px; }
.count { font-size: 14px; color: var(--c-gray); }
.filtersRight { display: flex; gap: 12px; }
.filtersRight input { width: 150px; padding: 8px 12px; }
.filtersRight select { width: 180px; padding: 8px 12px; }

.job {
  background: #fff; border-radius: var(--r); padding: 24px; margin-bottom: 16px;
  display: grid; grid-template-columns: 1fr auto; gap: 24px;
  box-shadow: var(--sh-sm); transition: transform var(--t), box-shadow var(--t);
}
.job:hover { transform: translateY(-2px); box-shadow: var(--sh); }
.jobTitle { font-size: 16px; font-weight: 700; margin-bottom: 12px; }
.author { display: flex; gap: 12px; align-items: center; margin-bottom: 8px; }
.author img { width: 40px; height: 40px; border-radius: 50%; }
.authorName { font-size: 13px; font-weight: 600; }
.authorMeta { font-size: 12px; color: var(--c-gray); }
.stars { display: flex; gap: 2px; align-items: center; }
.reviewsCount { font-size: 12px; color: var(--c-gray); margin-left: 8px; }
.jobRight { text-align: right; display: flex; flex-direction: column; justify-content: space-between; }
.budget { color: var(--c-primary); font-weight: 700; font-size: 16px; }
.time { font-size: 12px; color: var(--c-gray); margin-top: 4px; }
.offers { font-size: 13px; color: var(--c-gray); margin-top: 12px; }
.more { text-align: center; margin-top: 32px; }
.more button { padding: 12px 40px; }

@media (max-width: 700px) {
  .job { grid-template-columns: 1fr; }
  .jobRight { text-align: left; }
  .filtersRight { flex-wrap: wrap; }
}
END

cat > src/pages/exchange/exchange.jsx << 'END'
import { useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { EXCHANGE_JOBS } from 'shared/api/mocks';
import { StarIcon } from 'shared/ui/icon';
import styles from './exchange.module.css';

const TAGS = ['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'];

export const ExchangePage = () => {
  const nav = useNavigate();
  const [params] = useSearchParams();
  const [visible, setVisible] = useState(6);
  const category = params.get('cat') || 'дизайну';
  const jobs = [...EXCHANGE_JOBS, ...EXCHANGE_JOBS].slice(0, visible);

  return (
    <div className="pageFadeIn">
      <section className={styles.top}>
        <div className="container">
          <h1 className={styles.title}>
            Ищите и находите подходящую работу среди <span className={styles.hl}>10,000+</span> проектов
          </h1>
          <div className={styles.searchRow}>
            <input className="input" placeholder="Какую работу ищете?" />
            <button className="btn btn-peach">Найти</button>
          </div>
          <div className={styles.tags}>
            {TAGS.map(c => (
              <button key={c} className={styles.tag} onClick={() => nav(`/exchange?cat=${c}`)}>{c}</button>
            ))}
          </div>
        </div>
      </section>

      <section className={styles.list}>
        <div className="container">
          <h2 className={styles.listTitle}>Ниже все заказы по {category}</h2>

          <div className={styles.filters}>
            <div className={styles.count}>65 проектов по {category}</div>
            <div className={styles.filtersRight}>
              <input className="input" placeholder="Мин. цена" />
              <input className="input" placeholder="Макс. цена" />
              <select className="input">
                <option>По возрастанию цены</option>
                <option>По убыванию цены</option>
              </select>
            </div>
          </div>

          {jobs.map((j, idx) => (
            <div key={idx} className={styles.job}>
              <div>
                <h3 className={styles.jobTitle}>{j.title}</h3>
                <div className={styles.author}>
                  <img src={j.avatar} alt="" />
                  <div>
                    <div className={styles.authorName}>{j.author}</div>
                    <div className={styles.authorMeta}>Размещено проектов на бирже: {j.postedProjects}</div>
                  </div>
                </div>
                <div className={styles.stars}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= j.rating} size={14} />)}
                  <span className={styles.reviewsCount}>{j.reviews} отзывов</span>
                </div>
              </div>
              <div className={styles.jobRight}>
                <div>
                  <div className={styles.budget}>Бюджет: {j.budget.toLocaleString()} тенге</div>
                  <div className={styles.time}>{j.time}</div>
                  <div className={styles.offers}>Предложений: {j.offers}</div>
                </div>
              </div>
            </div>
          ))}

          {visible < 16 && (
            <div className={styles.more}>
              <button className="btn btn-outline" onClick={() => setVisible(v => v + 6)}>Загрузить еще</button>
            </div>
          )}
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './exchange';" > src/pages/exchange/index.js

# ============ WORKS PAGE ============
mkdir -p src/pages/works
cat > src/pages/works/works.module.css << 'END'
.section { padding: 60px 0; }
.title { font-size: 24px; font-weight: 800; margin-bottom: 24px; }
.filters { display: flex; justify-content: space-between; margin-bottom: 24px; flex-wrap: wrap; gap: 16px; }
.filters input { max-width: 400px; }
.filters select { width: 200px; }
.grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.more { text-align: center; margin-top: 40px; }
.more button { padding: 12px 40px; }
@media (max-width: 1024px) { .grid { grid-template-columns: repeat(2, 1fr); } }
@media (max-width: 600px) { .grid { grid-template-columns: 1fr; } }
END

cat > src/pages/works/works.jsx << 'END'
import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
import styles from './works.module.css';

export const WorksPage = () => {
  const nav = useNavigate();
  const works = [...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS];
  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <h1 className={styles.title}>65 ворков по дизайну</h1>
          <div className={styles.filters}>
            <input className="input" placeholder="Какую работу ищете?" />
            <select className="input">
              <option>По возрастанию цены</option>
              <option>По убыванию цены</option>
            </select>
          </div>
          <div className={styles.grid}>
            {works.slice(0, 12).map((w, i) => (
              <WorkCard
                key={i}
                work={{ ...w, avatar: `https://i.pravatar.cc/60?img=${20 + i}` }}
                onOrder={() => nav('/exchange')}
              />
            ))}
          </div>
          <div className={styles.more}>
            <button className="btn btn-outline">Загрузить еще</button>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './works';" > src/pages/works/index.js

# ============ CONTESTS PAGE ============
mkdir -p src/pages/contests
cat > src/pages/contests/contests.module.css << 'END'
.section { padding: 60px 0; }
.title { font-size: 32px; font-weight: 800; margin-bottom: 32px; }
.card {
  background: #fff; border-radius: var(--r-lg); padding: 40px;
  box-shadow: var(--sh-sm);
}
.steps { display: flex; gap: 12px; margin-bottom: 40px; flex-wrap: wrap; }
.step { display: flex; align-items: center; gap: 8px; }
.stepNum {
  width: 32px; height: 32px; border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  font-weight: 700; font-size: 13px;
  background: var(--c-border); color: #fff;
}
.stepActive { background: var(--c-primary); }
.stepLabel { font-size: 13px; font-weight: 500; color: var(--c-gray); }
.stepLabelActive { color: var(--c-primary); }

.grid4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; margin-bottom: 40px; }
.stepIcon { font-size: 40px; margin-bottom: 12px; }
.stepTitle { font-size: 15px; font-weight: 700; margin-bottom: 8px; }
.stepDesc { font-size: 12px; color: var(--c-gray); line-height: 1.6; }
.btnRow { display: flex; justify-content: space-between; margin-top: 40px; }
@media (max-width: 700px) { .grid4 { grid-template-columns: 1fr 1fr; } }
END

cat > src/pages/contests/contests.jsx << 'END'
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import styles from './contests.module.css';

const STEPS = ['Что такое конкурс?', 'Основное', 'Описание', 'Оплата', 'Публикация'];
const STEP_DATA = [
  { icon: '📋', t: 'Опубликуйте бриф', d: 'Зарезервируйте бюджет конкурса, и мы уведомим всех исполнителей.' },
  { icon: '🎨', t: 'Получайте варианты', d: 'Участники будут присылать вам готовые работы, которые вы сможете оценивать.' },
  { icon: '🏆', t: 'Выберите победителя', d: 'Определитесь с наилучшей работой на стадии финала и выберите ее победителем.' },
  { icon: '📦', t: 'Получите готовую работу', d: 'Проведите доработки в рабочей области, если это необходимо.' },
];

export const ContestsPage = () => {
  const nav = useNavigate();
  const [step, setStep] = useState(0);

  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <h1 className={styles.title}>Создание конкурса</h1>
          <div className={styles.card}>
            <div className={styles.steps}>
              {STEPS.map((s, i) => (
                <div key={s} className={styles.step}>
                  <div className={`${styles.stepNum} ${i <= step ? styles.stepActive : ''}`}>{i + 1}</div>
                  <span className={`${styles.stepLabel} ${i === step ? styles.stepLabelActive : ''}`}>{s}</span>
                </div>
              ))}
            </div>

            {step === 0 && (
              <div className={styles.grid4}>
                {STEP_DATA.map((s, i) => (
                  <div key={i}>
                    <div className={styles.stepIcon}>{s.icon}</div>
                    <div className={styles.stepTitle}>{s.t}</div>
                    <div className={styles.stepDesc}>{s.d}</div>
                  </div>
                ))}
              </div>
            )}
            {step === 1 && (
              <div style={{ maxWidth: 600 }}>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Название</label>
                <input className="input" placeholder="Название конкурса" style={{ marginBottom: 16 }} />
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Категория</label>
                <input className="input" placeholder="Выберите категорию" style={{ marginBottom: 16 }} />
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Бюджет</label>
                <input className="input" placeholder="250 000 тенге" />
              </div>
            )}
            {step === 2 && (
              <div style={{ maxWidth: 700 }}>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Описание</label>
                <textarea className="input" placeholder="Опишите конкурс" style={{ minHeight: 200 }} />
              </div>
            )}
            {step === 3 && (
              <div style={{ textAlign: 'center', padding: '20px 0' }}>
                <div style={{ fontSize: 14, color: 'var(--c-gray)', marginBottom: 12 }}>Сумма к оплате</div>
                <div style={{ fontSize: 28, fontWeight: 800, color: 'var(--c-primary)', marginBottom: 24 }}>250 000 тенге</div>
                <div style={{ display: 'flex', gap: 16, justifyContent: 'center', flexWrap: 'wrap' }}>
                  {['QIWI','WebMoney','VISA','MC'].map(p => (
                    <div key={p} style={{ padding: '12px 24px', background: '#fff', border: '1px solid var(--c-border)', borderRadius: 8, fontWeight: 700 }}>{p}</div>
                  ))}
                </div>
              </div>
            )}
            {step === 4 && (
              <div style={{ textAlign: 'center', padding: '40px 0' }}>
                <h3 style={{ fontSize: 24, fontWeight: 800, marginBottom: 12 }}>Поздравляем!</h3>
                <p style={{ fontSize: 14, color: 'var(--c-gray)', marginBottom: 24 }}>Ваш конкурс готов к публикации</p>
                <div style={{ fontSize: 100 }}>🎉</div>
              </div>
            )}

            <div className={styles.btnRow}>
              <button className="btn btn-ghost" style={{ padding: '12px 40px' }} onClick={() => step > 0 ? setStep(step - 1) : nav(-1)}>Назад</button>
              <button className="btn btn-primary" style={{ padding: '12px 40px' }} onClick={() => step < STEPS.length - 1 ? setStep(step + 1) : nav('/exchange')}>
                {step === STEPS.length - 1 ? 'Опубликовать' : 'Дальше'}
              </button>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};
END
echo "export * from './contests';" > src/pages/contests/index.js

echo ""
echo "PART 1 DONE"
