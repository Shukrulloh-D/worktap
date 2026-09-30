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
