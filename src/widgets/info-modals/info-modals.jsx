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
